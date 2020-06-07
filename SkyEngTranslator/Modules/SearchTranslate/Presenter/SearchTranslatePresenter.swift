//
//  SearchTranslatePresenter.swift
//  SkyEngTranslator
//
//  Created Aleksey Matyushkin on 05.06.2020.
//  Copyright © 2020 Aleksey Matyushkin. All rights reserved.
//

import Foundation

/// SearchTranslate Module Presenter
class SearchTranslatePresenter {
    
    private weak var view: SearchTranslateViewInput?
    private var interactor: SearchTranslateInteractorInput
    private var router: SearchTranslateRouterProtocol
    
    var sections: [String] = []
    var items: [[Meaning]] = []
    
    private var searchingWord = ""
    
    init(interactor: SearchTranslateInteractorInput,
         router: SearchTranslateRouterProtocol,
         view: SearchTranslateViewInput?) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
}

extension SearchTranslatePresenter: SearchTranslateViewOutput {
    
    func viewDidLoad() {
        interactor.output = self
    }
    
    func textFieldDidEdit(value: String) {
        searchingWord = value
    }
    
    func searchWordTranslate() {
        if searchingWord.count > 1 {
            interactor.getSearchWord(word: searchingWord)
        }
    }
    
    func cellDidSelect(index: IndexPath) {
        if let id = items[index.section][index.row].id {
            router.presentDetailedInfoModule(id: id)
        }
    }
    
    func getItemsCount(section: Int) -> Int {
        return items[section].count
    }
    
    func getItems(index: IndexPath) -> Meaning {
        return items[index.section][index.row]
    }
    
    func getSectionName(index: Int) -> String {
        if !sections.isEmpty {
            return sections[index]
        } else {
            return ""
        }
    }
    
    func getSectionsCount() -> Int {
        return sections.count
    }
}

extension SearchTranslatePresenter: SearchTranslateInteractorOutput {
    
    func searchWordLoaded(translated: [SearchTranslateElement]) {
        sections = translated.compactMap { $0.text }
        items = translated.compactMap { $0.meanings }
        DispatchQueue.main.async {
            self.view?.reloadTableView()
        }
    }
    
    func recivedError(error: ApiServiceError) {
        view?.showErrorAlert(message: error.description)
    }
}
