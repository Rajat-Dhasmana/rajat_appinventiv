//
//  VehiclesVC.swift
//  VehiclesCollection
//
//  Created by Rajat Dhasmana on 16/02/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class FilteredDataModel{
    
    var datafiltered : [[String:Any]]?
    
    
    init(jsondata data : [[String:Any]] , category : Category , company : Carcompany) {
        
        switch (company as Carcompany , category as Category) {
        
        case (.audi , .car) :
            
            datafiltered = data.filter({ (value) -> Bool in
                return value["category"] as! String == "CAR" && value["carcompany"] as! String == "AUDI"
            })

            
        case (.bmw , .car) :
            datafiltered = data.filter({ (value) -> Bool in
                return value["category"] as! String == "CAR" && value["carcompany"] as! String == "BMW"
            })
        
            
            
        case (.lamborghini , .car) :
            datafiltered = data.filter({ (value) -> Bool in
                return value["category"] as! String == "CAR" && value["carcompany"] as! String == "LAMBORGHINI"
            })
        
        default : fatalError("not found")
        
        }

        
    }
}

class DataModel {
    
    var carcategory : String
    var carcompany : String
    var carimage : UIImage
    
    init(jsondata data : [String:Any]) {
        
        carcategory = data["category"] as! String
        carcompany = data["carcompany"] as! String
        carimage = data["carimage"] as! UIImage
        
    }
    
}

enum Category {
    case car
    case bike
}

enum Carcompany {
    case audi
    case bmw
    case lamborghini
}


class VehiclesVC: UIViewController {

    
    @IBOutlet weak var mainTableView: UITableView!
    
    //var counter : Int?
   open var company : Carcompany!
   open var category : Category!
   open var counter : [[String : Any]]?
   open var filtereddictionary : [String : Any]?

   
    
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
            
        let cellNib1 = UINib(nibName: "CellForCollectionTableViewCell", bundle: nil)
        mainTableView.register(cellNib1, forCellReuseIdentifier: "CellForCollectionTableViewCellID")

            
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension VehiclesVC : UITableViewDelegate , UITableViewDataSource {

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tablecell = tableView.dequeueReusableCell(withIdentifier: "CellForCollectionTableViewCellID", for: indexPath) as! CellForCollectionTableViewCell
        switch (indexPath.row , indexPath.section) {
        case (0 , 0) :
            category = .car
            company = .audi
            tablecell.carCompanyLabel.text = "AUDI"
            tablecell.collectionViewOfItems.delegate = self
            tablecell.collectionViewOfItems.dataSource = self
            let cellNib2 = UINib(nibName: "VehiclesCollectionViewCell", bundle: nil)
            tablecell.collectionViewOfItems.register(cellNib2, forCellWithReuseIdentifier: "VehiclesCollectionViewCellID")

            return tablecell

        case (1 , 0):
            category = .car
            company = .bmw
            tablecell.carCompanyLabel.text = "BMW"
            tablecell.collectionViewOfItems.delegate = self
            tablecell.collectionViewOfItems.dataSource = self
            let cellNib2 = UINib(nibName: "VehiclesCollectionViewCell", bundle: nil)
            tablecell.collectionViewOfItems.register(cellNib2, forCellWithReuseIdentifier: "VehiclesCollectionViewCellID")
            return tablecell

        case (2 , 0) :
            category = .car
            company = .lamborghini
            tablecell.carCompanyLabel.text = "LAMBORGHINI"
            tablecell.collectionViewOfItems.delegate = self
            tablecell.collectionViewOfItems.dataSource = self
            let cellNib2 = UINib(nibName: "VehiclesCollectionViewCell", bundle: nil)
            tablecell.collectionViewOfItems.register(cellNib2, forCellWithReuseIdentifier: "VehiclesCollectionViewCellID")

            return tablecell

        default :
            fatalError("not found")
        }
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "CARS"
        default:
            fatalError("not found")
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
       

}

extension VehiclesVC : UICollectionViewDataSource , UICollectionViewDelegate {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 3
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch (company as Carcompany , category as Category) {
        case (.audi , .car) :
            counter = datacollection.filter({ (value) -> Bool in
                return value["category"] as! String == "CAR" && value["carcompany"] as! String == "LAMBORGHINI"
            })
            return counter!.count
            
        case (.bmw , .car) :
            counter = datacollection.filter({ (value) -> Bool in
                return value["category"] as! String == "CAR" && value["carcompany"] as! String == "LAMBORGHINI"
            })
            return counter!.count
            
            
        case (.lamborghini , .car) :
            counter = datacollection.filter({ (value) -> Bool in
                return value["category"] as! String == "CAR" && value["carcompany"] as! String == "LAMBORGHINI"
            })
            return counter!.count
            
            
            
        default : fatalError("not found")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectioncell = collectionView.dequeueReusableCell(withReuseIdentifier: "VehiclesCollectionViewCellID", for: indexPath) as! VehiclesCollectionViewCell
        
        
        switch (company as Carcompany , category as Category) {
            
        case (.audi , .car) :
            
            let filteredobj = FilteredDataModel(jsondata: datacollection , category: category , company: company)
            let collectionobj = DataModel(jsondata : filteredobj.datafiltered![indexPath.item])
            
            collectioncell.congigurecell(modelobject: collectionobj)
            collectioncell.layer.borderWidth = 1
            collectioncell.layer.borderColor = UIColor.black.cgColor
            collectioncell.favButton.addTarget(self, action: #selector(self.favButtonTapped), for: .touchUpInside)
            return collectioncell
            
        case (.bmw , .car) :
            let filteredobj = FilteredDataModel(jsondata: datacollection , category: category , company: company)
            let collectionobj = DataModel(jsondata : filteredobj.datafiltered![indexPath.item])
            
            collectioncell.congigurecell(modelobject: collectionobj)
            collectioncell.layer.borderWidth = 1
            collectioncell.layer.borderColor = UIColor.black.cgColor
            collectioncell.favButton.addTarget(self, action: #selector(self.favButtonTapped), for: .touchUpInside)
            return collectioncell
            
            
        case (.lamborghini , .car) :
            let filteredobj = FilteredDataModel(jsondata: datacollection , category: category , company: company)
            let collectionobj = DataModel(jsondata : filteredobj.datafiltered![indexPath.item])
            
            collectioncell.congigurecell(modelobject: collectionobj)
            collectioncell.layer.borderWidth = 1
            collectioncell.layer.borderColor = UIColor.black.cgColor
            collectioncell.favButton.addTarget(self, action: #selector(self.favButtonTapped), for: .touchUpInside)
            return collectioncell
            
            
        default : fatalError("not found")
        }
        func collectionView(collectionView: UICollectionView, didSelectItemAt: IndexPath){
            
            
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    
    func favButtonTapped(button : UIButton) {
        
        var cell : Any = button
        
        
        
        while !(cell is VehiclesCollectionViewCell) {
            cell = (cell as AnyObject).superview as Any
        }
        print(cell)
        let collectiontypecell = cell as! VehiclesCollectionViewCell
        
        while !(cell is CellForCollectionTableViewCell) {
            
            cell = (cell as AnyObject).superview as Any
        }
        let tabletypecell = cell as! CellForCollectionTableViewCell
        
        
        while !(cell is UITableView) {
            
            cell = (cell as AnyObject).superview as Any
        }
        
        let viewoftable = cell
        
        let collectionindexpath = tabletypecell.collectionViewOfItems.indexPath(for: collectiontypecell as UICollectionViewCell)
        
        let tableindexpath = (viewoftable as AnyObject).indexPath(for: tabletypecell as UITableViewCell)
        
        
        if button.isSelected == true {
            button.isSelected = false
            favourite.remove(at: favourite.index(where: { (a:[IndexPath]) -> Bool in
                
                return a == [tableindexpath!,collectionindexpath!]
            })!)
        }
        else{
            button.isSelected = true
            favourite.append([tableindexpath!,collectionindexpath!])
        }
        print(favourite)
        
    }
    



}




