//
//  GetTableCell.swift
//  TableCollectionPractice
//
//  Created by Rajat Dhasmana on 22/02/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    var cellforcollectionview : UICollectionViewCell? {
        var cell = self
        while !(cell is UICollectionViewCell) {
            
            guard let c = cell.superview else{ return nil}
            cell = c
        }
        return cell as? UICollectionViewCell
    }
    
    var cellfortableview : UITableViewCell? {
        var cell = self
        while !(cell is UITableViewCell) {
            
            guard let c = cell.superview else{ return nil}
            cell = c
        }
        return cell as? UITableViewCell
    }
    
    
}
