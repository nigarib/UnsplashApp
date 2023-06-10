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
    let cell1 = "\(TopicsViewCell.self)"
    let cell2 = "\(PhotosViewCell.self)"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection2.register(UINib(nibName: cell2, bundle: nil), forCellWithReuseIdentifier: cell2)
        collection1.register(UINib(nibName: cell1, bundle: nil), forCellWithReuseIdentifier: cell1)
        configure()
    }
    
    func configure() {
        photosViewModel.getPhotos()
        photosViewModel.getTopics()
        photosViewModel.successCallBack = {
            self.collection1.reloadData()
            self.collection2.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collection1 {
            return photosViewModel.topics.count
        } else {
            return photosViewModel.photos.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collection1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cell1, for: indexPath) as! TopicsViewCell
            cell.configure(data: photosViewModel.topics[indexPath.item])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cell2, for: indexPath) as! PhotosViewCell
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
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserPhotosViewController") as! UserPhotosViewController
            navigationController?.show(vc, sender: nil)
        } else {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserPhotosViewController") as! UserPhotosViewController
            vc.viewModel = UserPhotosViewModel(photos: photosViewModel.photos, index: indexPath.item)
            navigationController?.show(vc, sender: nil)
            
        }
    }

    @IBAction func infoButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "UnsplashInfoViewController") as! UnsplashInfoViewController
        navigationController?.show(vc, sender: nil)
    }
}
