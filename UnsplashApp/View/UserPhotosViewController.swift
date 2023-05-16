//
//  UserPhotosViewController.swift
//  UnsplashApp
//
//  Created by Nigar on 16.05.23.
//

import UIKit

class UserPhotosViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collection: UICollectionView!
    let cell = "\(PhotosViewCell.self)"
    var photosViewModel = PhotosViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.register(UINib(nibName: cell, bundle: nil), forCellWithReuseIdentifier: cell)
        configure()
    }
    
    func configure() {
        photosViewModel.getPhotos()
        photosViewModel.successCallBack = {
            self.collection.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photosViewModel.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cell, for: indexPath) as! PhotosViewCell
        cell.configure(data: photosViewModel.photos[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 400)
    }
    
}
