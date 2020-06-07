//
//  SearchTranslateViewProtocol.swift
//  SkyEngTranslator
//
//  Created by Aleksey Matyushkin on 05.06.2020.
//  Copyright © 2020 Aleksey Matyushkin. All rights reserved.
//

import UIKit

protocol SearchTranslateViewInput: UIViewController {
    func reloadTableView()
    func showErrorAlert(message: String)
}

protocol SearchTranslateViewOutput: class {
    
    func viewDidLoad()
    func textFieldDidEdit(value: String)
    func searchWordTranslate()
    func cellDidSelect(index: IndexPath)
    func getItems(index: IndexPath) -> Meaning
    func getItemsCount(section: Int) -> Int 
    func getSectionName(index: Int) -> String
    func getSectionsCount() -> Int
}
