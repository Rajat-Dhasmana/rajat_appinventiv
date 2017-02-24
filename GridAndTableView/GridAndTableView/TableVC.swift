//
//  TableVC.swift
//  GridAndTableView
//
//  Created by Mohd Sultan on 13/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class TableVC: UIViewController {

    
    
    @IBOutlet weak var NameTableView: UITableView!
    
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

        // Do any additional setup after loading the view.
    
    NameTableView.dataSource = self
        NameTableView.delegate = self
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   }

extension TableVC : UITableViewDataSource , UITableViewDelegate
{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return names.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tablecell = tableView.dequeueReusableCell(withIdentifier: "TableCellID", for: indexPath) as! TableCell
    
        
        let classobj = NameModel(dict: names[indexPath.row])
        
    tablecell.configurecell(data: classobj)
        
        return tablecell
    
    
    }


}


class TableCell : UITableViewCell
{
 
    @IBOutlet weak var tableImage: UIImageView!
    
    
    @IBOutlet weak var tableLabel: UILabel!
    
    func configurecell(data : NameModel)
{
    tableImage.backgroundColor = data.color
    
    tableLabel.text = data.name
    
    
    }


}





