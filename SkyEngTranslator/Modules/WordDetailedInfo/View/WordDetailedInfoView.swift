//
//  WordDetailedInfoiew.swift
//  SkyEngTranslator
//
//  Created by Aleksey Matyushkin on 06.06.2020.
//  Copyright © 2020 Aleksey Matyushkin. All rights reserved.
//

import UIKit

class WordDetailedInfoView: UIViewController {
    
    var output: WordDetailedInfoViewOutput?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
        prepareTableView()
    }
    
    func prepareTableView() {
        registerCells()
        tableView.dataSource = self
    }
    
    func registerCells() {
        tableView.register(UINib(nibName: String(describing: WordDetailedHeaderTableViewCell.self), bundle: nil),
                           forCellReuseIdentifier: String(describing: WordDetailedHeaderTableViewCell.self))
    }
}

extension WordDetailedInfoView: WordDetailedInfoViewInput {
    func reloadTableView() {
        tableView.reloadData()
    }
}

extension WordDetailedInfoView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output?.getItemsCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = output?.getModel(row: indexPath.row)
       
        if let cell = tableView.dequeueReusableCell(withIdentifier: model?.reuseID ?? "") as? WordDetailedInfoCellProtocol {
            cell.makeCell(model: model)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    
}

