//
//  APIServiceModels.swift
//  SkyEngTranslator
//
//  Created by Aleksey Matyushkin on 06.06.2020.
//  Copyright © 2020 Aleksey Matyushkin. All rights reserved.
//

import Foundation

// MARK: - SearchTranslateElement
struct SearchTranslateElement: Codable {
    let id: Int?
    let text: String?
    let meanings: [Meaning]?
}

struct Meaning: Codable {
    let id: Int?
    let translation: Translation?
    let previewURL, imageURL, transcription, soundURL: String?

    enum CodingKeys: String, CodingKey {
        case id, translation
        case previewURL
        case imageURL
        case transcription
        case soundURL
    }
}

struct Translation: Codable {
    let text: String?
    let note: String?
}

// MARK: - DetailedWordInfoElement
struct DetailedWordInfoElement: Codable {
    let id: String?
    let wordID, difficultyLevel: Int?
    let partOfSpeechCode, detailedWordInfoPrefix, text, soundURL: String?
    let transcription: String?
    let properties: Properties?
    let updatedAt, mnemonics: String?
    let translation: Translation?
    let images: [Image]?
    let definition: Definition?
    let examples: [Definition]?
    let meaningsWithSimilarTranslation: [MeaningsWithSimilarTranslation]?
    let alternativeTranslations: [AlternativeTranslation]?

    enum CodingKeys: String, CodingKey {
        case id
        case wordID
        case difficultyLevel, partOfSpeechCode
        case detailedWordInfoPrefix
        case text
        case soundURL
        case transcription, properties, updatedAt, mnemonics, translation, images, definition, examples, meaningsWithSimilarTranslation, alternativeTranslations
    }
}

// MARK: - AlternativeTranslation
struct AlternativeTranslation: Codable {
    let text: String?
    let translation: Translation?
}

// MARK: - Definition
struct Definition: Codable {
    let text, soundURL: String?

    enum CodingKeys: String, CodingKey {
        case text
        case soundURL
    }
}

// MARK: - Image
struct Image: Codable {
    let url: String?
}

// MARK: - MeaningsWithSimilarTranslation
struct MeaningsWithSimilarTranslation: Codable {
    let meaningID: Int?
    let frequencyPercent, partOfSpeechAbbreviation: String?
    let translation: Translation?

    enum CodingKeys: String, CodingKey {
        case meaningID
        case frequencyPercent, partOfSpeechAbbreviation, translation
    }
}

// MARK: - Properties
struct Properties: Codable {
    let collocation, irregular: Bool?
    let pastTense, pastParticiple, transitivity: String?
    let phrasalVerb: Bool?
    let soundURL: String?

    enum CodingKeys: String, CodingKey {
        case collocation, irregular, pastTense, pastParticiple, transitivity, phrasalVerb
        case soundURL
    }
}
