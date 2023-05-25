//
//  RegisterViewController.swift
//  UnsplashApp
//
//  Created by Nigar on 15.05.23.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    let registerViewModel = RegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerViewModel.readJsonFile()
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        if let firstname = firstname.text, !firstname.isEmpty,
           let lastname = lastname.text, !lastname.isEmpty,
           let username = username.text, !username.isEmpty,
           let email = email.text, !email.isEmpty,
           let password = password.text, !password.isEmpty {
            registerViewModel.users.append(RegisterUser(firstname: firstname, lastname: lastname, username: username, email: email, password: password))
            
            registerViewModel.backCallBack = {
                self.navigationController?.popViewController(animated: true)
            }
            registerViewModel.writeJsonFile()
        }
    }
    
}
