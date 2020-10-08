//
//  CvViewController.swift
//  AutoLayOut
//
//  Created by Pawan  on 07/10/2020.
//

import UIKit

class CvViewController: UIViewController {
    
    
    @IBOutlet weak var SelectVideoView: UIButton!
    @IBOutlet weak var innerTextView: UIView!
    @IBOutlet weak var lblEasyCapture: UILabel!
    @IBOutlet weak var lblAlbum: UILabel!
    var Arrayimg = [#imageLiteral(resourceName: "Wallpaper"),#imageLiteral(resourceName: "Sun"),#imageLiteral(resourceName: "Wallpaper"),#imageLiteral(resourceName: "Man"),#imageLiteral(resourceName: "Wallpaper"),#imageLiteral(resourceName: "Wallpaper"),#imageLiteral(resourceName: "Sun"),#imageLiteral(resourceName: "Man"),#imageLiteral(resourceName: "Wallpaper"),#imageLiteral(resourceName: "Wallpaper"),#imageLiteral(resourceName: "Wallpaper"),#imageLiteral(resourceName: "Wallpaper")]
    var logoImages: [UIImage] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        //register Collection View Cell
        collectionView.register(UINib(nibName: "CVCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cvCell")
        collectionView.layer.backgroundColor = .none
        
        SelectVideoView.layer.cornerRadius = 12
        SelectVideoView.layer.shadowOpacity = 0.2
        SelectVideoView.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        SelectVideoView.layer.shadowRadius = 1.0
        SelectVideoView.layer.shadowColor = UIColor.black.cgColor
//        innerTextView.layer.cornerRadius  = 12
        
       // innerTextView.layer.   = [.layerMaxXMinYCorner,.layerMinXMaxYCorner]
    }
    @IBAction func selectVideoButton(_ sender: UIButton) {
        photoLibrary()
    }
    
    @IBAction func settingsPressed(_ sender: Any) {
        let controller = PopupViewController()
        controller.modalPresentationStyle = .overCurrentContext
        self.present(controller, animated: true, completion: nil)
    }
    
    func photoLibrary(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self
            myPickerController.sourceType = .photoLibrary
            present(myPickerController, animated: true)
        }
    }
}

extension CvViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let logoImages2 = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                print("Image selected")
            logoImages.append(logoImages2)
            
        }
        dismiss(animated: true){
            self.collectionView.reloadData()
        }
    }
}






extension CvViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //functions
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        logoImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cvCell", for: indexPath) as! CVCollectionViewCell
        cell.backgroundColor = .red
        cell.profileImageView.image = logoImages[indexPath.row]
        cell.lblText.text = "Sun Set"
        cell.lblSecond.text = "07-10-2020"
        cell.lblTop.text = "5"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let columns: CGFloat    = 3
        let collectionViewWidth = collectionView.bounds.width
        let flowLayout          = collectionViewLayout as! UICollectionViewFlowLayout
        let spaceBetweenCells   = flowLayout.minimumInteritemSpacing * (columns - 1)
        let sectionInsets       = flowLayout.sectionInset.left + flowLayout.sectionInset.right
        let adjustedWidth       = collectionViewWidth - spaceBetweenCells - sectionInsets
        
        
        let width: CGFloat  = floor(adjustedWidth / columns)
        let height: CGFloat = collectionView.frame.height
        
        
        //   let width = collectionView.bounds.width - 50
        //   let height = width / 1.5
        
        return CGSize(width: width, height: height)
        
        
    }
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    //        return 10
    //   }
    //
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    //        return 10
    //    }
}
