//
//  DummyViewController.swift
//  Bankey
//
//  Created by Kopnuspos on 03/10/23.
//

import Foundation
import UIKit

class DummyViewController: UIViewController{
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        label.font = .preferredFont(forTextStyle: .title1)
        return label
    }()
    
    let logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Logout", for: [])
        button.configuration = .filled()
        return button
    }()
    
    weak var logoutDelegate: LogoutDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension DummyViewController{
    private func style(){
        for view in [stackView, label, logoutButton]{
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        logoutButton.addTarget(self, action: #selector(logoutTapped), for: .primaryActionTriggered)
    }
    
    private func layout(){
        for view in [label, logoutButton]{
            stackView.addArrangedSubview(view)
        }
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

extension DummyViewController{
    @objc func logoutTapped(_ sender: UIButton){
        print("test")
        logoutDelegate?.didLogout()
    }
}
