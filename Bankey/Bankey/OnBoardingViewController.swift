//
//  OnBoardingViewController.swift
//  Bankey
//
//  Created by Kopnuspos on 27/09/23.
//

import Foundation
import UIKit

class OnBoardingViewController: UIViewController{
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    let image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = .init(named: "delorean")
        return image
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.text = "Banker is faster, easy to use, and has brand new look and feel that will make you feel like you are back in 1989"
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
}

extension OnBoardingViewController{
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
