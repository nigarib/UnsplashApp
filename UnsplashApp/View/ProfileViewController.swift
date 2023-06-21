//
//  ProfileViewController.swift
//  UnsplashApp
//
//  Created by Nigar on 10.06.23.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collection: UICollectionView!
    
    var profileImage = UIImage(named: "profile")
    var picker = UIImagePickerController()
    var viewModel = ProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getUser()
        if let image = viewModel.currentUser?.profileImage {
            profileImage = UIImage(data: image)
        }
        collection.register(UINib(nibName: "PhotosViewCell", bundle: .main), forCellWithReuseIdentifier: "PhotosViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getItems()
        
        self.collection.reloadData()

    }
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            picker.delegate = self
            picker.allowsEditing = true
            picker.sourceType = .photoLibrary
            present(picker, animated: true)
        } else {
//            let alert = UIAlertController(title: "Camera Not Found", message: "This device has no Camera", preferredStyle: .Alert)
//            let ok = UIAlertAction(title: "OK", style:.Default, handler: nil)
//            alert.addAction(ok)
//            presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosViewCell", for: indexPath) as! PhotosViewCell
        cell.configure(data: viewModel.items[indexPath.item])
        cell.tag = indexPath.item
        cell.favoriteTapped = { index in
            self.viewModel.deleteItem(index: index)
            self.collection.reloadData()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(ProfileHeaderCollectionReusableView.self)", for: indexPath) as! ProfileHeaderCollectionReusableView
        header.configure(image: profileImage)
        header.imageCallBack = {
            self.openCamera()
        }
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 250)
    }
        
    @IBAction func logoutButton(_ sender: Any) {
        if UserDefaults.standard.bool(forKey: "loggedIn") {
            let loginNav = storyboard?.instantiateViewController(withIdentifier: "loginNav") as! UINavigationController
            tabBarController?.viewControllers?[2] = loginNav
        }
        
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let profileImage = info[.editedImage] as? UIImage else { return }
        self.profileImage = profileImage
        let adapter = UserRegisterAdapter()
        adapter.savePhotoImage(data: profileImage.pngData())
        dismiss(animated: true, completion: {
            self.collection.reloadData()
        })
    }
}


