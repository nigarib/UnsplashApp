//
//  TopicsViewCell.swift
//  UnsplashApp
//
//  Created by Nigar on 18.05.23.
//

import UIKit
import SDWebImage

class TopicsViewCell: UICollectionViewCell {

    @IBOutlet weak var topicImage: UIImageView!
    @IBOutlet weak var topicLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(data: Topic, hideImageView: Bool = true) {
        if hideImageView {
            topicImage.isHidden = true
            topicLabel.textColor = .black
        } else {
            topicImage.isHidden = false
            guard let url = data.previewPhotos?.first?.urls?.regular else { return }
            topicImage.loadUrl(url)
        }
        topicLabel.text = data.title
    }

}
