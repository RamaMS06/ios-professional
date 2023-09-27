//
//  ViewController.swift
//  Bankey
//
//  Created by Kopnuspos on 26/09/23.
//

import UIKit

class LoginViewController: UIViewController {

    let loginView = LoginView()
    let sigInButton = UIButton(type: .system)
    let errorLabel = UILabel()
    
    var username: String? {
        return loginView.usernameTF.text
    }
    
    var password: String? {
        return loginView.passwordTF.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension LoginViewController{
    
    private func style(){
        for view in [loginView, sigInButton, errorLabel]{
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        sigInButton.configuration = .filled()
        sigInButton.configuration?.imagePadding = 8
        sigInButton.setTitle("Sign In", for: [])
        sigInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorLabel.textAlignment = .center
        errorLabel.textColor = .systemRed
        errorLabel.text = "Error Failure"
        errorLabel.numberOfLines = 0
        errorLabel.isHidden = true
    }
    
    private func layout(){
        for view in [loginView, sigInButton, errorLabel]{
            self.view.addSubview(view)
        }
        
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
            
            sigInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            sigInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            sigInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            
            errorLabel.topAnchor.constraint(equalToSystemSpacingBelow: sigInButton.bottomAnchor, multiplier: 2),
            errorLabel.leftAnchor.constraint(equalTo: sigInButton.leftAnchor),
            errorLabel.rightAnchor.constraint(equalTo: sigInButton.rightAnchor)
        ])
    }
}

extension LoginViewController{
    
    @objc func signInTapped(sender: UIButton){
        errorLabel.isHidden = true
        login()
    }
    
    private func login(){
        guard let username = username, let password = password else {
            assertionFailure("Username / password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty{
            configureView("Username / password cannot be blank")
        }
        if username == "Admin" || password == "Admin"{
            sigInButton.configuration?.showsActivityIndicator = true
        }else{
            configureView("Username / password incorrect")
        }
    }
    
    private func configureView(_ message: String){
        errorLabel.isHidden = false
        errorLabel.text = message
    }
}
