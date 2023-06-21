//
//  TabbarController.swift
//  UnsplashApp
//
//  Created by Nigar on 10.06.23.
//

import UIKit

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTab()
    }
    
    func configureTab() {
        let photoNav = storyboard?.instantiateViewController(withIdentifier: "photoNav") as! UINavigationController
        
        let searchNav = storyboard?.instantiateViewController(withIdentifier: "searchNav") as! UINavigationController
        
        let loginNav = storyboard?.instantiateViewController(withIdentifier: "loginNav") as! UINavigationController
        
        let profileNav = storyboard?.instantiateViewController(withIdentifier: "profileNav") as! UINavigationController
        
        if UserDefaults.standard.bool(forKey: "loggedIn") {
            viewControllers = [photoNav, searchNav, profileNav]
        } else {
            viewControllers = [photoNav, searchNav, loginNav]
        }
    }

}
