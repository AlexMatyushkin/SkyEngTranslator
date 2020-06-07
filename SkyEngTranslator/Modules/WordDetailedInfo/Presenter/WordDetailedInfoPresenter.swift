//
//  WordDetailedInfoPresenter.swift
//  SkyEngTranslator
//
//  Created by Aleksey Matyushkin on 06.06.2020.
//  Copyright © 2020 Aleksey Matyushkin. All rights reserved.
//

import Foundation

class WordDetailedInfoPresenter {
   
    private weak var view: WordDetailedInfoViewInput?
    private var interactor: WordDetailedInfoInteractorInput
    private var router: WordDetailedInfoRouterProtocol
    
    var id: Int
    var items: [WordDetailedItem] = []
    var tableViewStructure = [WordDetailedStructer.header]
    
    init(interactor: WordDetailedInfoInteractorInput,
         router: WordDetailedInfoRouterProtocol,
         view: WordDetailedInfoViewInput?,
         id: Int) {
        self.interactor = interactor
        self.router = router
        self.view = view
        self.id = id
    }
    
    func getImageURL(for source: DetailedWordInfoElement) -> String {
        if let images = source.images,
            !images.isEmpty{
            return images[0].url ?? ""
        } else {
            return ""
        }
    }
    
    func makeHeaderModel(source: DetailedWordInfoElement) -> WordDetailedHeaderModel {
        
        return WordDetailedHeaderModel(reuseID: String(describing: WordDetailedHeaderTableViewCell.self),
                                       originalTitle: source.translation?.text ?? "",
                                       translatedTitle: source.text ?? "",
                                       description: source.transcription ?? "",
                                       imageURL: getImageURL(for: source))
    }
}

extension WordDetailedInfoPresenter: WordDetailedInfoViewOutput {
    
    func viewDidLoad() {
        interactor.output = self
        interactor.loadDetailedInfo(id: id)
    }
    
    func getItemsCount() -> Int {
        return tableViewStructure.count
    }
    
    func getModel(row: Int) -> WordDetailedModel? {
        if !items.isEmpty {
            return items[row].model
        } else {
            return nil
        }
    }
}

extension WordDetailedInfoPresenter: WordDetailedInfoInteractorOutput {
    
    func detailedInfoDidLoad(info: [DetailedWordInfoElement]) {
        if info.count == 1 {
            let header = makeHeaderModel(source: info[0])
            items.append(WordDetailedItem(structure: .header, model: header))
            DispatchQueue.main.async {
                self.view?.reloadTableView()
            }
        }
    }
    
    func recivedError(error: ApiServiceError) {
        print(error)
    }
}
