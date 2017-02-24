//
//  ProfileVC.swift
//  ProfileViewAgain
//
//  Created by Mohd Sultan on 08/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    
    @IBOutlet weak var profileTableView: UITableView!
  
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    
    
    let data = [
        ["titlename":"Full Name" , "titledetail":"Rajat Dhasmana"],
        ["titlename":"E-mail" , "titledetail":"rajatdhasmana@yahoo.in"],
        ["titlename":"Password" , "titledetail":"rajat1234"],
        ["titlename":"Height" , "titledetail":"5'10"],
        ["titlename":"Weight" , "titledetail":"68"],
        ["titlename":"Date Of Birth" , "titledetail":"5th june, 1995"]
        
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    self.profileTableView.dataSource = self
        
        self.profileTableView.delegate = self
        
        let cellNib1 = UINib(nibName: "ButtonCell", bundle: nil)
        profileTableView.register(cellNib1, forCellReuseIdentifier: "ButtonCellID")
      
        let cellNib2 = UINib(nibName: "ProfileDetailCellTableViewCell", bundle: nil)
        profileTableView.register(cellNib2, forCellReuseIdentifier:"ProfileDetailCellID" )
    
        
        let cellNib3 = UINib(nibName: "UpperCell", bundle: nil)
        profileTableView.register(cellNib3, forCellReuseIdentifier: "UpperCellID")
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(forName: .UIKeyboardDidShow, object: nil, queue: OperationQueue.main, using: {(Notification) -> Void in
        
           guard let userinfo = Notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue
            
            else{
            return
            }
        
           let keyboardHeight = userinfo.cgRectValue.height
            self.bottomConstraint.constant = keyboardHeight
            
            
        })
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
    extension ProfileVC : UITableViewDataSource , UITableViewDelegate
    {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return data.count + 2
        }
    
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            switch indexPath.row
            {
            case 0:
                let uppercell = tableView.dequeueReusableCell(withIdentifier: "UpperCellID") as! UpperCell
                
                return uppercell
            
            case 7:
                let buttoncell = tableView.dequeueReusableCell(withIdentifier: "ButtonCellID") as! ButtonCell
                return buttoncell
            
            default :
                let profiledetailcell = tableView.dequeueReusableCell(withIdentifier: "ProfileDetailCellID") as! ProfileDetailCellTableViewCell
            
          profiledetailcell.configureCell(
                data[indexPath.row - 1])
                return profiledetailcell
 
                
                }
            
        }

        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            switch indexPath.row
            {
            
            case 0 : return 272
                
            case 7 : return 160
            
            default : return 100
            
            
            }
        }
        
}

