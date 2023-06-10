//
//  PhotosViewCell.swift
//  UnsplashApp
//
//  Created by Nigar on 15.05.23.
//

import UIKit
import SDWebImage

class PhotosViewCell: UICollectionViewCell {
    
    @IBOutlet weak var buttonOutlet: UIButton!
    @IBOutlet weak var photoImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(data: Photos) {
        guard let url = data.urls?.thumb else { return }
        photoImage.loadUrl(url)
        buttonOutlet.setTitle(data.user?.firstName, for: .normal)
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        
    }
}

    
