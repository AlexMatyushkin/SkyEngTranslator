//
//  SearchTranslateTableViewCell.swift
//  SkyEngTranslator
//
//  Created by Aleksey Matyushkin on 06.06.2020.
//  Copyright © 2020 Aleksey Matyushkin. All rights reserved.
//

import UIKit

class SearchTranslateTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
 
    func setCellSettings(model: Meaning) {
        var text = model.translation?.text ?? ""
   
        titleLabel.text = text
    }
}
