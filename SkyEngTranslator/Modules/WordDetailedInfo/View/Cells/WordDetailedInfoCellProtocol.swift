//
//  WordDetailedInfoCellProtocol.swift
//  SkyEngTranslator
//
//  Created by Aleksey Matyushkin on 07.06.2020.
//  Copyright © 2020 Aleksey Matyushkin. All rights reserved.
//

import UIKit

protocol WordDetailedInfoCellProtocol: UITableViewCell {

    func makeCell(model: WordDetailedModel?)
}
