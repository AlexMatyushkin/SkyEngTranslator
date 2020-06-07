//
//  WordDetailedInfoFactory.swift
//  SkyEngTranslator
//
//  Created by Aleksey Matyushkin on 06.06.2020.
//  Copyright © 2020 Aleksey Matyushkin. All rights reserved.
//

import UIKit

class WordDetailedInfoFactory {
    
    static func makeModule(id: Int) -> UIViewController? {
        
        let storyboard = UIStoryboard(name: String(describing: WordDetailedInfoView.self), bundle: nil)
        
        let viewController = storyboard
            .instantiateViewController(withIdentifier: String(describing: WordDetailedInfoView.self)) as? WordDetailedInfoView
        
        let interactor = WordDetailedInfoInteractor()
        let router = WordDetailedInfoRouter()
        
        let presenter = WordDetailedInfoPresenter(interactor: interactor,
                                                  router: router,
                                                  view: viewController,
                                                  id: id)
        
        viewController?.output = presenter
        
        return viewController
    }
}
