//
//  ProfileHeaderCollectionReusableView.swift
//  UnsplashApp
//
//  Created by Nigar on 10.06.23.
//

import UIKit

class ProfileHeaderCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    var imageCallBack: (()->())?
    
    func configure(image: UIImage?) {
        userImage.image = image
        userLabel.text = UserDefaults.standard.string(forKey: "loggedInName")
    }
    
    override func layoutSubviews() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        userImage.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        imageCallBack?()
    }
}
