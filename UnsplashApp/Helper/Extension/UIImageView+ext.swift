//
//  File.swift
//  UnsplashApp
//
//  Created by Nigar on 15.05.23.
//

import Foundation
import SDWebImage

extension UIImageView {
    func loadUrl(_ posterPath: String) {
        if let url = URL(string: posterPath) {
            self.sd_setImage(with: url)
        }
    }
}
