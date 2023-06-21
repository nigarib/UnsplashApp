//
//  PhotosViewCell.swift
//  UnsplashApp
//
//  Created by Nigar on 15.05.23.
//

import UIKit
import SDWebImage

class PhotosViewCell: UICollectionViewCell {
    @IBOutlet weak var imageButtonOutlet: UIButton!
    @IBOutlet weak var buttonOutlet: UIButton!
    @IBOutlet weak var photoImage: UIImageView!
    
    var story: Photos?
    var isFavorite = false
    
    var favoriteTapped: ((Int) -> Void)?
    
    func configure(data: Photos) {
        guard let url = data.urls?.thumb else { return }
        photoImage.loadUrl(url)
        buttonOutlet.setTitle(data.user?.firstName, for: .normal)
        self.story = data
        isFavorite = data.isFavorite ?? false
        configureFavoriteButton()
    }
    
    func configureFavoriteButton() {
        imageButtonOutlet.setImage(isFavorite ? UIImage(systemName: "heart.fill")
                                   : UIImage(systemName: "heart"),
                                   for: .normal)
    }
    
    @IBAction func imageButtonAction(_ sender: Any) {
        isFavorite = !isFavorite
        configureFavoriteButton()
        favoriteTapped?(tag)
    }
}
