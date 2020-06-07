//
//  APIService.swift
//  SkyEngTranslator
//
//  Created by Aleksey Matyushkin on 06.06.2020.
//  Copyright © 2020 Aleksey Matyushkin. All rights reserved.
//

import Foundation

struct ApiServiceError: Error {
    var description: String
}

final class APIService {

    enum Service {
        case searchWordTranslate
        case fullInfo
        
        var name: String {
            switch self {
            case .searchWordTranslate:
                return "/words/search"
            case .fullInfo:
                return "/meanings"
            }
        }
    }
    

    private var url = "https://dictionary.skyeng.ru/api/public/v1"
    
    func searchWordTranslate(word: String,
                             completionHandler: @escaping (Result<[SearchTranslateElement], ApiServiceError>) -> Void) {
        
        var urlComponent = URLComponents(string: url + Service.searchWordTranslate.name)
        urlComponent?.queryItems = [
            URLQueryItem(name: "search", value: word)
        ]
        
        guard let url = urlComponent?.url else {
                completionHandler(.failure(ApiServiceError(description: "Fail to create URL")))
                return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let searchTranslates = try JSONDecoder().decode([SearchTranslateElement].self, from: data)
                    completionHandler(.success(searchTranslates))
                } catch let error {
                    completionHandler(.failure(ApiServiceError(description: error.localizedDescription)))
                }
            }
            if let error = error {
                completionHandler(.failure(ApiServiceError(description: error.localizedDescription)))
            }
        }.resume()
    }
    
    func loadWordDetailedInfo(id: Int, completionHandler: @escaping (Result<[DetailedWordInfoElement], ApiServiceError>) -> Void) {
        
        var urlComponent = URLComponents(string: url + Service.fullInfo.name)
        
        urlComponent?.queryItems = [
            URLQueryItem(name: "ids", value: String(id))
        ]
        
        guard let url = urlComponent?.url else {
                completionHandler(.failure(ApiServiceError(description: "Fail to create URL")))
                return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let detailedInfo = try JSONDecoder().decode([DetailedWordInfoElement].self, from: data)
                    completionHandler(.success(detailedInfo))
                } catch let error {
                    completionHandler(.failure(ApiServiceError(description: error.localizedDescription)))
                }
            }
            if let error = error {
                completionHandler(.failure(ApiServiceError(description: error.localizedDescription)))
            }
        }.resume()
    }
}
