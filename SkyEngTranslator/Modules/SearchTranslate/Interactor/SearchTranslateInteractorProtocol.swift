//
//  SearchTranslateInteractorProtocol.swift
//  SkyEngTranslator
//
//  Created by Aleksey Matyushkin on 05.06.2020.
//  Copyright © 2020 Aleksey Matyushkin. All rights reserved.
//

import Foundation

protocol SearchTranslateInteractorInput {
    var output: SearchTranslateInteractorOutput? { get set }
    
    func getSearchWord(word: String) 
}

protocol SearchTranslateInteractorOutput: class {
    func searchWordLoaded(translated: [SearchTranslateElement])
    func recivedError(error: ApiServiceError)
}
