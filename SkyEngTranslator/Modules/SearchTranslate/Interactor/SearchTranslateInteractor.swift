//
//  SearchTranslateInteractor.swift
//  SkyEngTranslator
//
//  Created Aleksey Matyushkin on 05.06.2020.
//  Copyright © 2020 Aleksey Matyushkin. All rights reserved.
//

import UIKit

class SearchTranslateInteractor {
    
    var apiService = APIService()
    
    weak var output: SearchTranslateInteractorOutput?
}

extension SearchTranslateInteractor: SearchTranslateInteractorInput {
    
    func getSearchWord(word: String) {
        apiService.searchWordTranslate(word: word, completionHandler: {[weak self] result in
            switch result {
            case .success(let translations):
                self?.output?.searchWordLoaded(translated: translations)
            case .failure(let error):
                self?.output?.recivedError(error: error)
            }
        })
    }
}
