//
//  TopicPhotosViewController.swift
//  UnsplashApp
//
//  Created by Nigar on 06.06.23.
//

import UIKit

class TopicPhotosViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collection: UICollectionView!
    var topicPhotosViewModel = TopicPhotosViewModel()
    var myTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.register(UINib(nibName: "PhotosViewCell", bundle: nil), forCellWithReuseIdentifier: "PhotosViewCell")
        
        topicPhotosViewModel.getTopicPhotos()
        topicPhotosViewModel.successCallBack = {
            self.collection.reloadData()
        }
        
        title = myTitle
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        topicPhotosViewModel.topicPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosViewCell", for: indexPath) as! PhotosViewCell
        cell.configure(data: topicPhotosViewModel.topicPhotos[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 2 - 10, height: 250)
    }

//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserPhotosViewController") as! UserPhotosViewController
//        navigationController?.show(vc, sender: nil)
//    }
}
