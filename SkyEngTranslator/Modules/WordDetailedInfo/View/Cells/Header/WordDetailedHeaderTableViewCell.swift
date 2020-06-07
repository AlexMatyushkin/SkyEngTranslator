//
//  WordDetailedHeaderTableViewCell.swift
//  SkyEngTranslator
//
//  Created by Aleksey Matyushkin on 07.06.2020.
//  Copyright © 2020 Aleksey Matyushkin. All rights reserved.
//

import UIKit

class WordDetailedHeaderTableViewCell: UITableViewCell, WordDetailedInfoCellProtocol {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var presentImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBAction func voiceRecord(_ sender: Any) {
        
    }
    
    func makeCell(model: WordDetailedModel?) {
        
        guard let model = model as? WordDetailedHeaderModel else {
            return
        }
        
        titleLabel.text = "\(model.originalTitle): \(model.translatedTitle)"
        
        if model.imageURL != "" {
            let link = "https:" + model.imageURL
            presentImageView.loadImage(by: String(link))
        } else {
            presentImageView.image = UIImage(named: "noImage")
        }
        
        descriptionLabel.text = "\(NSLocalizedString("Transcription:", comment: "")) \(model.description)"
    }
    
}
