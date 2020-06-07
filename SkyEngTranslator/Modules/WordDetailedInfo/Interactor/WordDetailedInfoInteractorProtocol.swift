//
//  WordDetailedInfoInteractorProtocol.swift
//  SkyEngTranslator
//
//  Created by Aleksey Matyushkin on 06.06.2020.
//  Copyright © 2020 Aleksey Matyushkin. All rights reserved.
//

import Foundation

protocol WordDetailedInfoInteractorInput {
    var output: WordDetailedInfoInteractorOutput? { get set }
 
    func loadDetailedInfo(id: Int)
}

protocol WordDetailedInfoInteractorOutput: class {
    func detailedInfoDidLoad(info: [DetailedWordInfoElement])
    func recivedError(error: ApiServiceError)
}
