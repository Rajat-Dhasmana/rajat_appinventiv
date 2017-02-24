//
//  CollectionVC.swift
//  CollectionViewFirst
//
//  Created by Rajat Dhasmana on 12/02/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class CarsModel
{
    var carname : String
    var carcolor : UIColor
    init(data : [String:Any]) {
            carname = data["carname"] as! String
            carcolor = data["carcolor"] as! UIColor
    }

}


class CollectionVC: UIViewController  {

    
    @IBOutlet weak var carsCollectionView: UICollectionView!
    
    

    
    let data = [
    ["carname" : "BMW" , "carcolor": UIColor.white],
    ["carname" : "Mercedes" , "carcolor": UIColor.orange],
    ["carname" : "Lamborgini" , "carcolor": UIColor.red],
    ["carname" : "jaguar" , "carcolor": UIColor.yellow],
    ["carname" : "Corvett" , "carcolor": UIColor.magenta],
    ["carname" : "Mclaren" , "carcolor": UIColor.brown],
    ["carname" : "Ford" , "carcolor": UIColor.darkGray],
    ["carname" : "Honda" , "carcolor": UIColor.gray],
    ["carname" : "Volksvagen" , "carcolor": UIColor.green],
    ["carname" : "RollsRoyce" , "carcolor": UIColor.black],
    ["carname" : "Tata" , "carcolor": UIColor.blue]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        self.carsCollectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension CollectionVC : UICollectionViewDataSource
{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = carsCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCellID", for:
            indexPath) as! CollectionCell
    
        
        let datavalue = CarsModel(data: data[indexPath.row])
    cell.configurecell(byclass: datavalue)
        
        return cell
    }

}



class CollectionCell : UICollectionViewCell
{
    @IBOutlet weak var carImageView: UIImageView!

    @IBOutlet weak var carLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
    func configurecell(byclass data : CarsModel){
    carImageView.backgroundColor = data.carcolor
        carLabel.text = data.carname
    
    
    }
    
    


}





