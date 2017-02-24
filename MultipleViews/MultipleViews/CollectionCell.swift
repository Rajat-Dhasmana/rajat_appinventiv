//
//  CollectionCell.swift
//  MultipleViews
//
//  Created by Mohd Sultan on 13/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {

  
    @IBOutlet weak var collectionImage: UIImageView!
    
    
    @IBOutlet weak var collectionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configurecell(object : NameModel)
    {
        
        collectionImage.image = object.imagecell
        
        collectionLabel.text = object.name
        
        
    }
    

    

}
