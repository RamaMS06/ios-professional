//
//  OnBoardingViewController.swift
//  Bankey
//
//  Created by Rama Muhammad S on 27/09/23.
//

import Foundation
import UIKit



class OnBoardingViewController: UIViewController{
    
    private let stackView = UIStackView()
    private let image = UIImageView()
    private let label = UILabel()
    private let imageName: String
    private let labelDesc: String
    
    init(imageName: String, labelDesc: String){
        self.imageName = imageName
        self.labelDesc = labelDesc
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension OnBoardingViewController{
    
    private func style(){
        view.backgroundColor = .white
        for view in [stackView, image, label]{
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        stackView.axis = .vertical
        stackView.spacing = 20
        
        image.contentMode = .scaleAspectFit
        image.image = .init(named: imageName)
        
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.text = labelDesc
        
    }
    
    private func layout(){
        view.addSubview(stackView)
        for view in [image, label]{
            stackView.addArrangedSubview(view)
        }
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])
    }
}
