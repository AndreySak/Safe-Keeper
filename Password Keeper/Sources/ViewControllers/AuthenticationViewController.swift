//
//  ViewController.swift
//  Password Keeper
//
//  Created by Andrey Sak on 12/24/17.
//  Copyright © 2017 Andrey Sak. All rights reserved.
//

import UIKit
import EasyPeasy

class AuthenticationViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    
    private weak var masterPasswordTextField: UITextField?
    private weak var loginButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        masterPasswordTextField = generateMasterTextField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let masterPasswordTextField = masterPasswordTextField,
            let loginButton = loginButton else {
                return
        }
        
        stackView.addArrangedSubview(masterPasswordTextField)
        stackView.addArrangedSubview(loginButton)
        
        masterPasswordTextField.isHidden = true
        loginButton.isHidden = true
        
        UIView.animate(withDuration: 1) {
            masterPasswordTextField.isHidden = false
            loginButton.isHidden = false
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        masterPasswordTextField?.easy.layout([Height(44.0), Width(view.frame.width / 2.0)])
        loginButton?.easy.layout([Height(44.0), Width(view.frame.width / 2.0)])
    }
    
    private func generateMasterTextField() -> UITextField {
        let masterTextField = UITextField()
        
        masterTextField.placeholder = "Master password"
        masterTextField.backgroundColor = UIColor.white
        masterTextField.borderStyle = .roundedRect
        masterTextField.textContentType = .password
        
        return masterTextField
    }
    
    private func generateLoginButton() -> UIButton {
        let loginButton = UIButton()
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.backgroundColor = UIColor.white
        
        loginButton.layer.cornerRadius = 4.0
        loginButton.clipsToBounds = true
        
        return loginButton
    }
}

