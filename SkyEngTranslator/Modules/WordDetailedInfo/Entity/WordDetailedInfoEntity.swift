//
//  WordDetailedInfoEntity.swift
//  SkyEngTranslator
//
//  Created by Aleksey Matyushkin on 07.06.2020.
//  Copyright © 2020 Aleksey Matyushkin. All rights reserved.
//

import Foundation

enum WordDetailedStructer {
    case header
}

struct WordDetailedItem {
    let structure: WordDetailedStructer
    var model: WordDetailedModel
}

protocol WordDetailedModel {
    var reuseID: String { get set }
}

struct WordDetailedHeaderModel: WordDetailedModel {
    var reuseID: String
    var originalTitle: String
    var translatedTitle: String
    var description: String
    var imageURL: String
}
