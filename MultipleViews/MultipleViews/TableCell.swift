//
//  TableCell.swift
//  MultipleViews
//
//  Created by Mohd Sultan on 13/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit





class TableCell: UICollectionViewCell

{


    @IBOutlet weak var tableImage: UIImageView!
    
    
    @IBOutlet weak var tableLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func configurecell(object : NameModel)
    {
        
        tableImage.image = object.imagecell
        
        tableLabel.text = object.name
        
        
    }
    

    
}
