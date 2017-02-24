//
//  RandomColorGenerator.swift
//  Myntra
//
//  Created by Rajat Dhasmana on 20/02/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

extension UIColor
{
    static var getRandomColor : UIColor{
        
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }
    
}

