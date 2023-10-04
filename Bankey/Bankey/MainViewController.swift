//
//  MainViewController.swift
//  Bankey
//
//  Created by Kopnuspos on 04/10/23.
//

import Foundation
import UIKit

class MainViewController: UITabBarController{
    
    let accountVC = AccountSummaryViewController()
    let moneyVC = MoveMoneyViewController()
    let moreVC = MoreViewController()
    var listNC = [UINavigationController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTabBar()
    }
}

extension MainViewController{
    
    private func setupViews(){
        accountVC.setTabBarImage(imageName: "list.dash.header.rectangle", title: "Summary")
        moneyVC.setTabBarImage(imageName: "arrow.left.arrow.right", title: "Move Money")
        moreVC.setTabBarImage(imageName: "ellipsis.circle", title: "More")
        
        for view in [accountVC, moneyVC, moreVC]{
            listNC.append(UINavigationController(rootViewController: view))
        }
        
        listNC.first?.navigationBar.barTintColor = appColor
        hideNavigationBarLine(listNC.first!.navigationBar)
        viewControllers = listNC
    }
    
    private func hideNavigationBarLine(_ navigationBar: UINavigationBar){
        let img = UIImage()
        navigationBar.shadowImage = img
        navigationBar.setBackgroundImage(img, for: .default)
        navigationBar.isTranslucent = false
    }
    
    private func setupTabBar(){
        tabBar.tintColor = appColor
        tabBar.isTranslucent = false
    }
}
