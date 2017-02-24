//
//  CollectionCell.swift
//  TableCollectionPractice
//
//  Created by Rajat Dhasmana on 22/02/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {

    var collectionindexpath : IndexPath!
    var hdimage = UIImageView()
    
    @IBOutlet weak var favouriteButton: UIButton!
    
    @IBOutlet weak var cellImage: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

}
