//
//  LoginViewController.swift
//  UnsplashApp
//
//  Created by Nigar on 14.05.23.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailLogin: UITextField!
    @IBOutlet weak var passwordLogin: UITextField!
    var viewModel = RegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getItems()
    }
    
    @IBAction func loginButton(_ sender: Any) {
        if let email = emailLogin.text, !email.isEmpty,
           let password = passwordLogin.text, !password.isEmpty {
            
            if viewModel.validateLogin(email: email, password: password) {
                UserDefaults.standard.set(true, forKey: "loggedIn")
                if let profile = viewModel.getProfile(email: email) {
                    UserDefaults.standard.set(profile.username, forKey: "loggedInName")
                    UserDefaults.standard.set(profile.email, forKey: "loggedInEmail")
                }
                let profileNav = storyboard?.instantiateViewController(withIdentifier: "profileNav") as! UINavigationController
                tabBarController?.viewControllers?[2] = profileNav
            }
        }
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
        
    }
    
    @IBAction func registerButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        navigationController?.show(vc, sender: nil)
    }
    
}
