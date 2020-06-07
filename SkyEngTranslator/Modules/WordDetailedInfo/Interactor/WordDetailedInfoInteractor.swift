//
//  WordDetailedInfoInteractor.swift
//  SkyEngTranslator
//
//  Created by Aleksey Matyushkin on 06.06.2020.
//  Copyright © 2020 Aleksey Matyushkin. All rights reserved.
//

import Foundation

class WordDetailedInfoInteractor {
    
    weak var output: WordDetailedInfoInteractorOutput?
    
    let apiService = APIService()
}

extension WordDetailedInfoInteractor: WordDetailedInfoInteractorInput {
    
    func loadDetailedInfo(id: Int) {
        apiService.loadWordDetailedInfo(id: id, completionHandler: { [weak self] result in
            switch result {
            case .success(let detailedInfo):
                self?.output?.detailedInfoDidLoad(info: detailedInfo)
            case .failure(let error):
                self?.output?.recivedError(error: error)
            }
        })
    }
}
