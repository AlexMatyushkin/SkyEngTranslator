//
//  UIImageView + Extansion.swift
//  SkyEngTranslator
//
//  Created by Aleksey Matyushkin on 07.06.2020.
//  Copyright © 2020 Aleksey Matyushkin. All rights reserved.
//

import UIKit

extension UIImageView {
    
    private func loadingImage(by link: String, completionHandler: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: link) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                completionHandler(.success(data))
            }
            if let error = error {
                completionHandler(.failure(error))
            }
        }.resume()
    }
    
    
    func loadImage(by link: String) {
        loadingImage(by: link, completionHandler: { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.image = UIImage(data: data)
                }
            case .failure(_):
                DispatchQueue.main.async {
                    self?.image = UIImage(named: "noImage")
                }
            }
        })
    }
}
