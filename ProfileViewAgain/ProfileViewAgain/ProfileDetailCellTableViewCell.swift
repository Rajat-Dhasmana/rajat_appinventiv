//
//  ProfileDetailCellTableViewCell.swift
//  ProfileViewAgain
//
//  Created by Mohd Sultan on 08/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class ProfileDetailCellTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var titleDetailLabel: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(_ data : [String : String])
    {
    
    titleLabel.text = data["titlename"]
    titleDetailLabel.text = data["titledetail"]
    
    }
    
    
}
