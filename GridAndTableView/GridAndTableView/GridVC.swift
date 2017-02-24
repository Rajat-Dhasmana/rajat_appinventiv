//
//  GridVC.swift
//  GridAndTableView
//
//  Created by Mohd Sultan on 13/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit


class NameModel
{
    var name : String
    var color : UIColor
    init(dict data : [String:Any]) {
        name = data["name"] as! String
        color = data["color"] as! UIColor
    }


}


class GridVC: UIViewController {

    
    @IBOutlet weak var switchView: UISegmentedControl!
    
    
    @IBOutlet weak var tableLikeView: UIView!
    
    
    @IBOutlet weak var collectionLikeView: UIView!
    
    let names = [
        ["name" : "Rajat Dhasmana" , "color":UIColor.black],
        ["name" : "Rajat Dhasmana" , "color":UIColor.yellow],
        ["name" : "Rajat Dhasmana" , "color":UIColor.red],
        ["name" : "Rajat Dhasmana" , "color":UIColor.gray],
        ["name" : "Rajat Dhasmana" , "color":UIColor.blue],
        ["name" : "Rajat Dhasmana" , "color":UIColor.green],
        ["name" : "Rajat Dhasmana" , "color":UIColor.brown]
    
    
    
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   
    collectionLikeView.isHidden = true
        tableLikeView.isHidden = false
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    @IBAction func changeSegment(_ sender: UISegmentedControl) {
   
    switch switchView.selectedSegmentIndex
    {
    case 0 : tableLikeView.isHidden = false
            collectionLikeView.isHidden = true
        
    case 1: tableLikeView.isHidden = true
            collectionLikeView.isHidden = false
        
    default : break
        
        }
    
    
    
    }
    
    

}

