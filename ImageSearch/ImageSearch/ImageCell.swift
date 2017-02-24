//
//  ImageCell.swift
//  ImageSearch
//
//  Created by Rajat Dhasmana on 21/02/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {
    
    
    @IBOutlet weak var searchedImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
