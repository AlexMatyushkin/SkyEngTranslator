//
//  SearchTranslateView.swift
//  SkyEngTranslator
//
//  Created Aleksey Matyushkin on 05.06.2020.
//  Copyright © 2020 Aleksey Matyushkin. All rights reserved.
//

import UIKit

/// SearchTranslate Module View
class SearchTranslateView: UIViewController {
    
    var output: SearchTranslateViewOutput?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle()
        prepareTextField()
        prepareTableView()
        output?.viewDidLoad()
    }
    
    func setTitle() {
        navigationItem.title = NSLocalizedString("Skyeng Translater", comment: "") 
    }
    
    func prepareTextField() {
        searchTextField.delegate = self
    }
    
    func prepareTableView() {
        registerCell()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func textFieldDidEdit(_ sender: Any) {
        guard let text = (sender as? UITextField)?.text else { return }
        output?.textFieldDidEdit(value: text)
    }
    
    @IBAction func searchButtonDidTap(_ sender: Any) {
        (sender as? UITextField)?.resignFirstResponder()
        output?.searchWordTranslate()
    }
    
    func registerCell() {
        tableView.register(UINib(nibName: String(describing: SearchTranslateTableViewCell.self), bundle: nil),
                           forCellReuseIdentifier: String(describing: SearchTranslateTableViewCell.self))
    }
}

extension SearchTranslateView: SearchTranslateViewInput {

    func reloadTableView() {
        self.tableView.reloadData()
    }
    
    func showErrorAlert(message: String) {
        let alert = UIAlertController(title: NSLocalizedString("Network error", comment: ""),
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: NSLocalizedString("Ok", comment: ""),
                                     style: .cancel)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}

extension SearchTranslateView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        output?.searchWordTranslate()
        return true
    }
}

extension SearchTranslateView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output?.cellDidSelect(index: indexPath)
    }
}

extension SearchTranslateView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return output?.getSectionsCount() ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output?.getItemsCount(section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
         return output?.getSectionName(index: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier:
            String(describing: SearchTranslateTableViewCell.self)) as? SearchTranslateTableViewCell,
            let model = output?.getItems(index: indexPath) {
            cell.setCellSettings(model: model)
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
