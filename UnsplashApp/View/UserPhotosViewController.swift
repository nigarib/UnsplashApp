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
    var viewModel: UserPhotosViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.register(UINib(nibName: cell, bundle: nil), forCellWithReuseIdentifier: cell)
        
        configure()
    }
    
    func configure() {
//        photosViewModel.getPhotos()
//        photosViewModel.successCallBack = {
//            self.collection.reloadData()
//        }
        collection.layoutIfNeeded()
        collection.scrollToItem(at: IndexPath(item: viewModel?.index ?? 0, section: 0), at: .centeredHorizontally, animated: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.photos.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cell, for: indexPath) as! PhotosViewCell
        if let data = viewModel?.photos {
            cell.configure(data: data[indexPath.item])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
