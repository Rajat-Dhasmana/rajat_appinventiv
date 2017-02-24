//
//  MultipleVC.swift
//  MultipleViews
//
//  Created by Mohd Sultan on 13/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

//MARK: Data Model
class NameModel
{
    var name : String
    
    var imagecell : UIImage
    
    init(dict data : [String:Any]) {
     
        name = data["name"] as! String
      
        imagecell = data["imagename"] as! UIImage
   
    }
    
}

//MARK: Main class

class MultipleVC: UIViewController {
//MARK: IBOutlets
//...................collection view outlet............................
    @IBOutlet weak var nameCollectionView: UICollectionView!
   
  //..........................button outlet.............................
    
    @IBOutlet weak var switchButton: UIButton!
   
    
    var listflag = Bool()
//....................dictionary data.................................
    
    let names = [
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!],
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!],
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!],
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!],
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!],
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!],
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!],
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!],
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!],
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!],
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!],
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!],
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!],
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!],
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!],
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!],
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!],
        ["name" : "Rajat Dhasmana" , "imagename":UIImage(named: "minion")!]
    ]
//MARK: Application Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       //nameCollectionView.backgroundColor = UIColor.clear
       
        nameCollectionView.dataSource = self
        
        nameCollectionView.delegate = self
    
    
   //......................regestering nib files............................
        
        let cellNib1 = UINib(nibName: "CollectionCell", bundle: nil)
        
         nameCollectionView.register(cellNib1, forCellWithReuseIdentifier: "CollectionCellID")
  
    
        let cellNib2 = UINib(nibName: "TableCell", bundle: nil)
        
        nameCollectionView.register(cellNib2, forCellWithReuseIdentifier: "TableCellID")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


 //MARK: IBAction of Button
    @IBAction func pressedButton(_ sender: Any) {
    
 
    
    if switchButton.isSelected
    {
        switchButton.isSelected = false
       
        listflag = false
        
        nameCollectionView.performBatchUpdates({
            
            self.nameCollectionView.layoutIfNeeded()
            
        }, completion: {(flag) in
            
            self.nameCollectionView.reloadData()
        
        })
       
       
        
    }
    
    else
    {
        switchButton.isSelected = true
        
        listflag = true
        
        nameCollectionView.performBatchUpdates({
            
            self.nameCollectionView.layoutIfNeeded()
        
        }, completion: {(flag) in
            
            self.nameCollectionView.reloadData()
        
        })
    }
    
        self.nameCollectionView.layoutIfNeeded()
    }
    
    
}


//MARK: UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout


extension MultipleVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout
{
    
    
    func animateCell(cell: UICollectionViewCell) {
        let animation = CABasicAnimation(keyPath: "cornerRadius")
        animation.fromValue = 200
        
        animation.toValue = 0
        animation.duration = 1
        cell.layer.add(animation, forKey: animation.keyPath)
    }
    
    
    
 //..................returning no. of cells...................
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }
    
//..........................returning collection view cells..................
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if listflag == false
        {    let collectioncell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCellID", for: indexPath) as! CollectionCell
        
        let nameobj = NameModel(dict : names[indexPath.item])
        
        collectioncell.configurecell(object: nameobj)
         
            collectioncell.layer.borderWidth = 2.0
     
            collectioncell.layer.borderColor = UIColor.green.cgColor
            animateCell(cell: collectioncell)
        return collectioncell
       
        }
        
        else
        {
            let tablecell = collectionView.dequeueReusableCell(withReuseIdentifier: "TableCellID", for: indexPath) as! TableCell
            
            let nameobj = NameModel(dict : names[indexPath.item])
            
            tablecell.configurecell(object: nameobj)
          
            tablecell.layer.borderWidth = 2.0
         
            tablecell.layer.borderColor = UIColor.green.cgColor
        animateCell(cell: tablecell)
            return tablecell
        
            
        }
    }
   
//.........................adjusting size of cell..........................
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if listflag == true
        {
        
        return CGSize(width: 375, height: 73)
        }
    else
        {
            return CGSize(width: 160, height: 160)
        
        }
    
    }
    
}
