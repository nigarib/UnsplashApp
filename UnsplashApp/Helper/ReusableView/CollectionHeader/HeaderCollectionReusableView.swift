//
//  HeaderCollectionReusableView.swift
//  UnsplashApp
//
//  Created by Nigar on 23.05.23.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet private weak var collection: UICollectionView!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var topicLabel: UILabel!
    
    
    let cell = "\(TopicsViewCell.self)"
    var topics = [Topic]()
    var callBack: ((Int,String)->())?
    
    
    override func layoutSubviews() {
        collection.register(UINib(nibName: cell, bundle: nil), forCellWithReuseIdentifier: cell)
        topicLabel.text = "Browse by Category"
        cellLabel.text = "Discover"
    }
    
    func configure(data: [Topic]) {
        self.topics = data
        collection.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        topics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cell, for: indexPath) as! TopicsViewCell
        cell.configure(data: topics[indexPath.item], hideImageView: false)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 2 - 10, height: collectionView.frame.height / 2 - 10)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        callBack?(indexPath.item,topics[indexPath.item].title!)
    }
}
