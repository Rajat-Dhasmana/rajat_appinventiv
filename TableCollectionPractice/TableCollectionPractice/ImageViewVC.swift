//
//  ImageViewVC.swift
//  TableCollectionPractice
//
//  Created by Rajat Dhasmana on 23/02/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class ImageViewVC: UIViewController {

   
    @IBOutlet weak var viewImage: UIImageView!
    
    var imagereceived : UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //let tap = UITapGestureRecognizer(target: self, action: #selector(viewImageDoubleTapped))
        //viewImage.addGestureRecognizer(tap)

        
           }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.viewImage.image = imagereceived
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

//extension ImageViewVC {
//    
//    
//    
//    func viewImageDoubleTapped(tap : UITapGestureRecognizer) {
//        
//        print("doubletapped")
//        
//        self.navigationController?.isNavigationBarHidden = true
//        
//        let newimageview = self.viewImage!
//        newimageview.backgroundColor = UIColor.black
//        newimageview.frame = self.view.frame
//        newimageview.contentMode = .scaleToFill
//        newimageview.isUserInteractionEnabled = true
//        self.view.addSubview(newimageview)
//    }
//}
