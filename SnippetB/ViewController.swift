//
//  ViewController.swift
//  SnippetB
//
//  Created by Daniel Wohlmuth on 15.01.20.
//  Copyright © 2020 Daniel Wohlmuth. All rights reserved.
//

import UIKit
import KeychainSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let keychain = KeychainSwift()

    override func viewDidLoad() {
        super.viewDidLoad()

        if let userName = keychain.get("userName"),
            let password = keychain.get("password") {
            
            userNameTextField.text = userName
            passwordTextField.text = password
        }
    }

    @IBAction func savePassword(_ sender: Any) {
        guard let userName = self.userNameTextField.text,
            let password = self.passwordTextField.text else { return }

        keychain.set(userName, forKey: "userName")
        keychain.set(password, forKey: "password")
        
        print("Stored user and password in Keychain.")
    }
}
