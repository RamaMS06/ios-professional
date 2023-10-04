//
//  UIViewController+Utils.swift
//  Bankey
//
//  Created by Kopnuspos on 04/10/23.
//

import UIKit

extension UIViewController{
    func setStatusBar(){
        let statusBarView: UIView = .init(frame: .init(origin: .zero, size: UIApplication.shared.statusBarFrame.size))
        
        statusBarView.backgroundColor = appColor
        view.addSubview(statusBarView)
    }
    
    func setTabBarImage(imageName: String, title: String){
        let config = UIImage.SymbolConfiguration(scale: .large)
        let image: UIImage = .init(systemName: imageName, withConfiguration: config)!
        tabBarItem = .init(title: title, image: image, tag: 0)
    }
}
