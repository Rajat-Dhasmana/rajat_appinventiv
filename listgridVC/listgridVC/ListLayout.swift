//
//  ListLayout.swift
//  listgridVC
//
//  Created by Mohd Sultan on 14/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class ListLayout: UICollectionViewFlowLayout {

    override init() {
        super.init()
        setuplayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
         setuplayout()
           }
    
//      required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setuplayout()
//    }
    
       func setuplayout() {
        minimumInteritemSpacing = 0
        minimumLineSpacing = 1
        scrollDirection = .vertical
    }
    
    func itemwidth() -> CGFloat {
        return (collectionView!.frame.width)
    }
    
    
    override var itemSize: CGSize {
        
        
        set {
            
            self.itemSize = CGSize(width: itemwidth(), height: 124)
        }
        
        
        get {
            
            return CGSize(width: itemwidth(), height: 124)
            
            
        }
        
    }

       
    
    
}
