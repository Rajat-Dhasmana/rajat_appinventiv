//
//  UpperCell.swift
//  ProfileViewAgain
//
//  Created by Mohd Sultan on 08/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class UpperCell: UITableViewCell {

    
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//  profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.layer.bounds.width/2
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
