//
//  CollectionVC.swift
//  GridAndTableView
//
//  Created by Mohd Sultan on 13/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class CollectionVC: UIViewController {

    
    @IBOutlet weak var nameCollectionView: UICollectionView!
    
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

        
        nameCollectionView.dataSource = self
        nameCollectionView.delegate = self
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension CollectionVC : UICollectionViewDelegate , UICollectionViewDataSource
{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
  let collectioncell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCellID", for: indexPath) as! CollectionCell
        
        let nameobj = NameModel(dict : names[indexPath.item])
    
    collectioncell.configurecell(object: nameobj)
        
        return collectioncell
    
    }
    


}



class CollectionCell : UICollectionViewCell
{

    @IBOutlet weak var collectionImage: UIImageView!
   
    
    
    @IBOutlet weak var collectionLabel: UILabel!
    
    func configurecell(object : NameModel)
    {
    
    collectionImage.backgroundColor = object.color
        
        collectionLabel.text = object.name
    
    
    }



}





