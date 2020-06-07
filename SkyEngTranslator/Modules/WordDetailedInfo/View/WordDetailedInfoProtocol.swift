//
//  WordDetailedInfoProtocol.swift
//  SkyEngTranslator
//
//  Created by Aleksey Matyushkin on 06.06.2020.
//  Copyright © 2020 Aleksey Matyushkin. All rights reserved.
//
import UIKit

protocol WordDetailedInfoViewInput: UIViewController {
    var output: WordDetailedInfoViewOutput? { get set }
    
    func reloadTableView()
}

protocol WordDetailedInfoViewOutput: class {
    func viewDidLoad()
    func getItemsCount() -> Int
    func getModel(row: Int) -> WordDetailedModel?
}
