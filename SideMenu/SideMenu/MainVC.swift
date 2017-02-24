//
//  MainVC.swift
//  SideMenu
//
//  Created by Rajat Dhasmana on 23/02/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

//MARK: IBOutlets
    @IBOutlet weak var visibleContainerView: UIView!
    
    
    @IBOutlet weak var slidemenuButton: UIButton!
    
    var slide : UIViewController!
    var visiblecontroller : UIViewController!
   
//MARK: App LifeCycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let secondviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "VisibleVCID") as! VisibleVC
        
        self.visiblecontroller = secondviewcontroller
        
        self.addChildViewController(visiblecontroller)
        
        self.visibleContainerView.addSubview(visiblecontroller.view)
        
        self.slide = self.storyboard?.instantiateViewController(withIdentifier: "SlideVCID") as! SlideVC
        
        self.slide.view.frame = CGRect(x: -220, y: 100, width: 200, height: 600)

        self.addChildViewController(slide)
        
        self.view.addSubview(slide.view)
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//MARK: Function to change colour
    
    func changeViewController (colour : UIColor) {

        self.visiblecontroller.removeFromParentViewController()
        switch colour {
            
        case UIColor.red :
            let secondviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "RedVCID") as! RedVC
            
            self.visiblecontroller = secondviewcontroller
            
            self.addChildViewController(visiblecontroller)
            
            self.visibleContainerView.addSubview(visiblecontroller.view)
        case UIColor.green :
            let secondviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "GreenVCID") as! GreenVC
            
            self.visiblecontroller = secondviewcontroller
            
            self.addChildViewController(visiblecontroller)
            
            self.visibleContainerView.addSubview(visiblecontroller.view)

        case UIColor.blue :
            let secondviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "BlueVCID") as! BlueVC
            
            self.visiblecontroller = secondviewcontroller
            
            self.addChildViewController(visiblecontroller)
            
            self.visibleContainerView.addSubview(visiblecontroller.view)

        case UIColor.black :
            let secondviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "BlackVCID") as! BlackVC
            
            self.visiblecontroller = secondviewcontroller
            
            self.addChildViewController(visiblecontroller)
            
            self.visibleContainerView.addSubview(visiblecontroller.view)

        case UIColor.yellow :
            let secondviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "YellowVCID") as! YellowVC
            
            self.visiblecontroller = secondviewcontroller
            
            self.addChildViewController(visiblecontroller)
            
            self.visibleContainerView.addSubview(visiblecontroller.view)


        default : fatalError("not found")
            
        }
        
    }


    
    
    @IBAction func slidemenuButtonTapped(_ sender: UIButton) {
    
        if slidemenuButton.isSelected {
            
            slidemenuButton.isSelected = false
            UIView.animate(withDuration: 0.1, animations: {
                self.slide.view.frame = CGRect(x: -220, y: 100, width: 200, height: 600)
            })
            
                }
        
        else {
            slidemenuButton.isSelected = true
            
            UIView.animate(withDuration: 0.1, animations: {
                self.slide.view.frame = CGRect(x: 0, y: 100, width: 200, height: 600)
            })

        }
    
    }
    

}

