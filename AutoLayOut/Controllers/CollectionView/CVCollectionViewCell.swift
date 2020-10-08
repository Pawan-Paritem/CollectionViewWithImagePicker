//
//  CVCollectionViewCell.swift
//  AutoLayOut
//
//  Created by Pawan  on 07/10/2020.
//

import UIKit

class CVCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblTop: UILabel!
    @IBOutlet weak var lblSecond: UILabel!
    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var collectionView : UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 12
        lblTop.layer.cornerRadius = 4
        lblTop.clipsToBounds = true
        lblTop.layer.opacity = 0.5
       
        
    }

}
