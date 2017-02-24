//
//  CollectionViewCell.swift
//  Myntra
//
//  Created by Rajat Dhasmana on 18/02/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var favouriteButton: UIButton!
    
    
    @IBOutlet weak var collectionCellImage: UIImageView!
    
    
    var favourite : favourite!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        self.collectionCellImage.backgroundColor = UIColor.red
    }

}
