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
    
    private var masterPasswordTextField: UITextField!
    
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
        
        stackView.addArrangedSubview(masterPasswordTextField)
        
        masterPasswordTextField.isHidden = true
        
        UIView.animate(withDuration: 1) {
            self.masterPasswordTextField.isHidden = false
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        masterPasswordTextField.easy.layout([Height(44.0), Width(view.frame.width / 2.0)])
    }
    
    private func generateMasterTextField() -> UITextField {
        let masterTextField = UITextField()
        
        masterTextField.placeholder = "Master password"
        masterTextField.backgroundColor = UIColor.white
        masterTextField.borderStyle = .roundedRect
        masterTextField.textContentType = .password
        
        return masterTextField
    }
}

