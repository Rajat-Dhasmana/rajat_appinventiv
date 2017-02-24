//
//  TableCell.swift
//  TableCollectionPractice
//
//  Created by Rajat Dhasmana on 22/02/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {
    
    
    var tableindexpath : IndexPath!
    
    
    @IBOutlet weak var tableLabel: UILabel!
    
    @IBOutlet weak var collectView: UICollectionView!
    
    @IBOutlet weak var tableCellMinimiseButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        collectView.reloadData()
    }

}
