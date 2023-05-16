//
//  MainViewController.swift
//  UnsplashApp
//
//  Created by Nigar on 13.05.23.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collection1: UICollectionView!
    @IBOutlet weak var collection2: UICollectionView!
    
    var photosViewModel = PhotosViewModel()
    let cell = "\(PhotosViewCell.self)"
    override func viewDidLoad() {
        super.viewDidLoad()
        collection2.register(UINib(nibName: cell, bundle: nil), forCellWithReuseIdentifier: cell)
        configure()
    }
    
    func configure() {
        photosViewModel.getPhotos()
        photosViewModel.successCallBack = {
            self.collection2.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collection1 {
            return 10
        } else {
            return photosViewModel.photos.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collection1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath)
            cell.backgroundColor = .blue
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cell, for: indexPath) as! PhotosViewCell
            cell.configure(data: photosViewModel.photos[indexPath.item])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collection1 {
            return CGSize(width: collectionView.frame.width / 2 - 10, height: 20)
        } else {
            return CGSize(width: collectionView.frame.width, height: 250)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collection1 {
            print("hi")
        } else {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserPhotosViewController") as! UserPhotosViewController
            navigationController?.show(vc, sender: nil)
            
        }
    }

}
