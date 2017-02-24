//
//  TableViewCell.swift
//  Myntra
//
//  Created by Rajat Dhasmana on 18/02/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var tableCellLabel: UILabel!
    
    
    @IBOutlet weak var viewOfCollection: UICollectionView!
    
    @IBOutlet weak var toggleButton: UIButton!
    
    
    @IBOutlet weak var labelBottomConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
   toggleButton.setTitle("+", for: .selected)
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
