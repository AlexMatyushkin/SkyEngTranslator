//
//  SearchTranslateFactory.swift
//  SkyEngTranslator
//
//  Created by Aleksey Matyushkin on 05.06.2020.
//  Copyright © 2020 Aleksey Matyushkin. All rights reserved.
//

import UIKit

class SearchTranslateFactory {
    
    static func makeModule(navigator: UINavigationController) -> UIViewController? {
        
        let storyboard = UIStoryboard(name: String(describing: SearchTranslateView.self), bundle: nil)
        
        let viewController = storyboard
            .instantiateViewController(withIdentifier: String(describing: SearchTranslateView.self)) as? SearchTranslateView
        
        let interactor = SearchTranslateInteractor()
        let router = SearchTranslateRouter(navigator: navigator)
        
        let presenter = SearchTranslatePresenter(interactor: interactor,
                                                 router: router,
                                                 view: viewController)
        
        viewController?.output = presenter
        
        return viewController
    }
}
