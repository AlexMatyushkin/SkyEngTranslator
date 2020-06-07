//
//  Navigator.swift
//  SkyEngTranslator
//
//  Created by Aleksey Matyushkin on 05.06.2020.
//  Copyright © 2020 Aleksey Matyushkin. All rights reserved.
//

import UIKit

class Navigator {
    
    var mainNavigator = UINavigationController()
 
    init() {
        
        if let rootViewController = SearchTranslateFactory.makeModule(navigator: mainNavigator) {
            mainNavigator.setViewControllers([rootViewController], animated: true)
        }
        
        UIApplication.shared.windows.first?.rootViewController = mainNavigator
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}

