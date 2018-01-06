//
//  ViewController.swift
//  Password Keeper
//
//  Created by Andrey Sak on 12/24/17.
//  Copyright © 2017 Andrey Sak. All rights reserved.
//

import UIKit

class AuthenticationViewController: UIViewController {

    @IBOutlet weak var appIconCenterYConstraint: NSLayoutConstraint!
    @IBOutlet weak var appIconTopOffsetConstraint: NSLayoutConstraint!
    @IBOutlet weak var appIconWidthConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5) {
//            self.appIconWidthConstraint.setMultiplier(multiplier: 1 / 3)
//            self.appIconTopOffsetConstraint.constant = 20.0
            self.appIconCenterYConstraint.constant = 50.0
            self.view.layoutIfNeeded()
        }
    }


}

extension NSLayoutConstraint {

    func setMultiplier(multiplier:CGFloat) -> NSLayoutConstraint {
        
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint(
            item: firstItem,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant)
        
        newConstraint.priority = priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
}

