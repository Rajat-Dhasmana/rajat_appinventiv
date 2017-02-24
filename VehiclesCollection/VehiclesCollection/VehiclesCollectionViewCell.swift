//
//  VehiclesCollectionViewCell.swift
//  VehiclesCollection
//
//  Created by Rajat Dhasmana on 16/02/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class VehiclesCollectionViewCell: UICollectionViewCell {

    
    
    @IBOutlet weak var vehicleImage: UIImageView!
    
    @IBOutlet weak var vehicleLabel: UILabel!
    
    
    @IBOutlet weak var favButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func congigurecell(modelobject datamodel : DataModel) {
        
        vehicleImage.image = datamodel.carimage
        vehicleLabel.text = datamodel.carcompany
        
        
    }
    
    

}
