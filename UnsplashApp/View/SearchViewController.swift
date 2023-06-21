//
//  SearchViewController.swift
//  UnsplashApp
//
//  Created by Nigar on 13.05.23.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var customView: UIView!
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var collection: UICollectionView!
    
    let cell2 = "\(PhotosViewCell.self)"
    var searchViewModel = SearchViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.register(UINib(nibName: cell2, bundle: nil), forCellWithReuseIdentifier: cell2)

        configure()
    }
    
    func configure() {
        searchViewModel.getPhotos()
        searchViewModel.getTopics()
        searchViewModel.successCallBack = {
            self.collection.reloadData()
        }
    }
    
    @IBAction func searchAction(_ sender: UITextField) {
        if let searchText = sender.text, !searchText.isEmpty {
            searchViewModel.getSearchMovies(text: searchText)
        } else {
            searchViewModel.getPhotos()
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        searchViewModel.searchResult.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cell2, for: indexPath) as! PhotosViewCell
        cell.configure(data: searchViewModel.searchResult[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(HeaderCollectionReusableView.self)", for: indexPath) as! HeaderCollectionReusableView
        header.configure(data: searchViewModel.topics)
        header.callBack = { index , title in
            let controller = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "TopicPhotosViewController") as! TopicPhotosViewController
            controller.topicPhotosViewModel.id = self.searchViewModel.topics[index].id ?? ""
            controller.myTitle = title
            self.navigationController?.show(controller, sender: nil)
        }
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 2 - 10, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserPhotosViewController") as! UserPhotosViewController
        vc.viewModel = UserPhotosViewModel(photos: searchViewModel.searchResult, index: indexPath.item)
        navigationController?.show(vc, sender: nil)
    }
}
