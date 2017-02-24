//
//  CellForCollectionTableViewCell.swift
//  VehiclesCollection
//
//  Created by Rajat Dhasmana on 16/02/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class CellForCollectionTableViewCell: UITableViewCell  {

    
    @IBOutlet weak var carCompanyLabel: UILabel! 
    
//    var company : Carcompany!
//    var category : Category!
    var counter : [[String : Any]]?
    var filtereddictionary : [String : Any]?
    
    
    @IBOutlet weak var collectionViewOfItems: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
   
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


