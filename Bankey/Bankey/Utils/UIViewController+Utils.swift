//
//  UIViewController+Utils.swift
//  Bankey
//
//  Created by Rama Muhammad S on 04/10/23.
//

import UIKit

extension UIViewController{
    func setStatusBar() {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithTransparentBackground() // to hide Navigation Bar Line also
            navBarAppearance.backgroundColor = appColor
            UINavigationBar.appearance().standardAppearance = navBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        }
    
    func setTabBarImage(imageName: String, title: String){
        let config = UIImage.SymbolConfiguration(scale: .large)
        let image: UIImage = .init(systemName: imageName, withConfiguration: config)!
        tabBarItem = .init(title: title, image: image, tag: 0)
    }
}
