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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func loginButton(_ sender: Any) {
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
    }
    
    @IBAction func registerButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        navigationController?.show(vc, sender: nil)

    }
    
}
