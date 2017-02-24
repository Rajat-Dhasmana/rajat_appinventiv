//
//  GridLayout.swift
//  listgridVC
//
//  Created by Mohd Sultan on 14/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class GridLayout: UICollectionViewFlowLayout {

    override init()
    {
    super.init()
    setuplayout()
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setuplayout()
    }
    
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: NSCoder)
//        setuplayout()
//
//    }
    
    
    func setuplayout()
    {
    minimumLineSpacing = 1
    minimumInteritemSpacing = 0
    scrollDirection = .vertical
    
    }
    
    func itemwidth() -> CGFloat
    {
    return ((collectionView!.frame.width)/2) - 1
    
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
