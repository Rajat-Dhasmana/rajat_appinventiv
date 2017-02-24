//
//  SlideVC.swift
//  SideMenu
//
//  Created by Rajat Dhasmana on 23/02/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class SlideVC: UIViewController {
    
//MARK: IBOutlets
    @IBOutlet weak var slideTableView: UITableView!
    
//MARK: class life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        slideTableView.delegate = self
        slideTableView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

//MARK: extension UITableViewDataSource , UITableViewDelegate

extension SlideVC : UITableViewDataSource , UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SlideCellID", for: indexPath) as? SlideCell else {
            
            fatalError("not found")
        }
        
        switch indexPath.row {
            case 0:  cell.textLabel?.text = "RED"
            case 1:  cell.textLabel?.text = "GREEN"
            case 2:  cell.textLabel?.text = "BLUE"
            case 3:  cell.textLabel?.text = "BLACK"
            case 4:  cell.textLabel?.text = "YELLOW"
            default : fatalError("not found")

        }
     
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
       let vc = self.parent as! MainVC
        switch indexPath.row {
            
            case 0 : vc.changeViewController( colour : UIColor.red)

            case 1 :   vc.changeViewController( colour : UIColor.green)
            
            case 2 :   vc.changeViewController( colour : UIColor.blue)
            
            case 3 :  vc.changeViewController( colour : UIColor.black)
            
            case 4 :  vc.changeViewController( colour : UIColor.yellow)
            
            default : fatalError("not found")
        
        }
        
        
    }
    
}

//MARK: Slide Cell Class

class SlideCell : UITableViewCell {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.textLabel?.text = "COLOR"
    
    }
    
}
