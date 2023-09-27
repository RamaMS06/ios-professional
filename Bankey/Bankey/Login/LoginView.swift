//
//  LoginView.swift
//  Bankey
//
//  Created by Kopnuspos on 26/09/23.
//

import Foundation
import UIKit

class LoginView: UIView{
    
    static let shared = LoginView()
    
    let stackView = UIStackView()
    let usernameTF = UITextField()
    let passwordTF = UITextField()
    let divider = UIView()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView{
    
    private func style(){
        
        backgroundColor = .secondarySystemBackground
        
        for view in [self, stackView, usernameTF, passwordTF, divider]{
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        stackView.axis = .vertical
        stackView.spacing = 8
        
        usernameTF.placeholder = "Username"
        usernameTF.delegate = self
        
        passwordTF.placeholder = "Password"
        passwordTF.isSecureTextEntry = true
        passwordTF.delegate = self
        
        divider.backgroundColor = .secondarySystemFill
        
        layer.cornerRadius = 5
        clipsToBounds = true
    }
    
    private func layout(){
        addSubview(stackView)
        for view in [usernameTF, divider, passwordTF]{
            stackView.addArrangedSubview(view)
        }
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leftAnchor.constraint(equalToSystemSpacingAfter: leftAnchor, multiplier: 1),
            rightAnchor.constraint(equalToSystemSpacingAfter: stackView.rightAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1),
            
            divider.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}

extension LoginView: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTF.endEditing(true)
        passwordTF.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
