//
//  ButtonCell.swift
//  ProfileViewAgain
//
//  Created by Mohd Sultan on 08/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class ButtonCell: UITableViewCell {

    
    @IBOutlet weak var SaveButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
   
    SaveButton.layer.cornerRadius = SaveButton.layer.bounds.width/10
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
