//
//  ViewImage.swift
//  ImageSearch
//
//  Created by Rajat Dhasmana on 21/02/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import Foundation
import  UIKit

class ViewImageVC : UIViewController {
    
    
    @IBOutlet weak var viewImage: UIImageView!
    
    var imagereceived = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    override func viewDidLayoutSubviews() {
        self.viewImage.image = imagereceived
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    
    
    
}
