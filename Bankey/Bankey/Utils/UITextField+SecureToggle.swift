//
//  UITextField+SecureToogle.swift
//  Bankey
//
//  Created by Rama Muhammad S on 09/10/23.
//

import Foundation
import UIKit

let passwordToggleButton = UIButton(type: .custom)

extension UITextField{
    
    func enablePasswordToggle(){
        passwordToggleButton.setImage(.init(systemName: "eye.fill"), for: .normal)
        passwordToggleButton.setImage(.init(systemName: "eye.slash.fill"), for: .selected)
        passwordToggleButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        rightView = passwordToggleButton
        rightViewMode = .always
    }
    
    @objc private func togglePasswordView(){
        isSecureTextEntry.toggle()
        passwordToggleButton.isSelected.toggle()
    }
}
