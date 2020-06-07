//
//  SearchTranslateRouter.swift
//  SkyEngTranslator
//
//  Created Aleksey Matyushkin on 05.06.2020.
//  Copyright © 2020 Aleksey Matyushkin. All rights reserved.
//

import UIKit

class SearchTranslateRouter: SearchTranslateRouterProtocol {
    
    var navigator: UINavigationController?
    
    init(navigator: UINavigationController?) {
        self.navigator = navigator
    }
    
    func presentDetailedInfoModule(id: Int) {
        if let viewController = WordDetailedInfoFactory.makeModule(id: id) {
           navigator?.pushViewController(viewController, animated: true)
        }
    }
}
