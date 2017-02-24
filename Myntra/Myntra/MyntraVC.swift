//
//  MyntraVC.swift
//  Myntra
//
//  Created by Rajat Dhasmana on 18/02/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit
import AlamofireImage


class MyntraVC: UIViewController {

//MARK: IBOutlets
    
    @IBOutlet weak var myntraTableView: UITableView!
    
    var favouriteindices = Array<IndexPath>()
    var typesofcars = Array<String>()
    var imagelist = [ImageInfo]()
    var minimisetableindices = Array<IndexPath>()
    var minimisesectionindices = Array<Int>()
    var collectionindices = [IndexPath : UICollectionViewCell]()
    var tableindices = [IndexPath : UITableViewCell]()
    
//MARK: App LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view, typically from a nib.
    
        myntraTableView.delegate = self
        
        myntraTableView.dataSource = self
        
        myntraTableView.allowsSelection = false
        
        let cellNib1 = UINib(nibName: "TableViewCell", bundle: nil)
        
        myntraTableView.register(cellNib1, forCellReuseIdentifier: "TableViewCellID")
        
        let cellNib3 = UINib(nibName: "HeaderViewController", bundle: nil)
        
        myntraTableView.register(cellNib3, forHeaderFooterViewReuseIdentifier: "HeaderViewControllerID")
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//MARK: extension UITableViewDataSource , UITableViewDelegate

extension MyntraVC : UITableViewDataSource , UITableViewDelegate  {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if minimisesectionindices.contains(section) {
            return 0
        }
        else {
            return 3
        }
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
            let celltable = tableView.dequeueReusableCell(withIdentifier: "TableViewCellID", for: indexPath) as! TableViewCell
       
        
            switch indexPath.row {
            
            case 0:  Webservices().fetchDataFromPixabay(withQuery: "cars", success: { (images : [ImageInfo]) in
            
                    self.imagelist = images
                    celltable.viewOfCollection.reloadData()
            
                    }) { (error : Error) in
            
                        print(error)
            
                        }
                    print(imagelist)
                    let cellNib2 = UINib(nibName: "CollectionViewCell", bundle: nil)
                    celltable.viewOfCollection.register(cellNib2, forCellWithReuseIdentifier: "CollectionViewCellID")
                    celltable.viewOfCollection.delegate = self
                    celltable.viewOfCollection.dataSource = self
                    celltable.tableCellLabel.text = "CARS"


            case 1:     Webservices().fetchDataFromPixabay(withQuery: "bikes", success: { (images : [ImageInfo]) in
            
                            self.imagelist = images
                            celltable.viewOfCollection.reloadData()
            
                        }) { (error : Error) in
            
                                print(error)
            
                            }
        
            let cellNib2 = UINib(nibName: "CollectionViewCell", bundle: nil)
            celltable.viewOfCollection.register(cellNib2, forCellWithReuseIdentifier: "CollectionViewCellID")
            celltable.viewOfCollection.delegate = self
            celltable.viewOfCollection.dataSource = self
            celltable.tableCellLabel.text = "BIKES"

            case 2:   Webservices().fetchDataFromPixabay(withQuery: "trucks", success: { (images : [ImageInfo]) in
            
                            self.imagelist = images
                            celltable.viewOfCollection.reloadData()
            
                        }) { (error : Error) in
            
                                print(error)
            
                            }
        
            let cellNib2 = UINib(nibName: "CollectionViewCell", bundle: nil)
            celltable.viewOfCollection.register(cellNib2, forCellWithReuseIdentifier: "CollectionViewCellID")
            celltable.viewOfCollection.delegate = self
            celltable.viewOfCollection.dataSource = self
            celltable.tableCellLabel.text = "TRUCKS"

        
            default : fatalError("not found")
        
        }
        
        celltable.toggleButton.addTarget(self, action: #selector(self.toggleButtonTapped), for: .touchUpInside)
        //tableindices[indexPath] = celltable
        return celltable
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if minimisetableindices.contains(indexPath) {
            return 49
        }
        else {
            return 160
        }
    }
    

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
   
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerobject = myntraTableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderViewControllerID") as? HeaderViewController else {    fatalError("not found")      }
        switch section {
        case 0:  headerobject.headerLabel.text = "MEN"
        case 1: headerobject.headerLabel.text = "WOMEN"
        case 2: headerobject.headerLabel.text = "KIDS"
        default:  fatalError("not found")
            
        }
        headerobject.minimiseSectionButton.addTarget(self, action: #selector(self.minimiseSectionButtonTapped), for: .touchUpInside)
        headerobject.minimiseSectionButton.tag = section
        if minimisesectionindices.contains(section) {
            headerobject.minimiseSectionButton.isSelected = true
        }
        else {
            
            headerobject.minimiseSectionButton.isSelected = false
        }
         return headerobject
        
    }
    
//MARK: Toggle button tapping
    
    func toggleButtonTapped(button : UIButton) {
        
        guard let cell = button.cellfortableview as? TableViewCell else{
            fatalError()
        }
        
        let celloftable = cell
        
        let rowoftable = myntraTableView.indexPath(for: celloftable)
        
        
        if button.isSelected {
                button.isSelected = false
                button.setTitle("-", for: .normal)
                print("is not selected")
                minimisetableindices = minimisetableindices.filter({ (indices) -> Bool in
                    return indices != rowoftable
                })
            
                myntraTableView.reloadRows(at: minimisetableindices, with: .none)
        }
            
        else {
            
            button.isSelected = true
            button.setTitle("+", for: .selected)
            print("is selected")
            minimisetableindices.append(rowoftable!)
            myntraTableView.reloadRows(at: minimisetableindices, with: .none)
        }
        
    }

//MARK: Minimise Section Button Tapped Action
    func minimiseSectionButtonTapped(button: UIButton) {

        
        if button.isSelected {
            button.isSelected = false
            button.setTitle("-", for: .normal)
            print("is not selected")
            minimisesectionindices = minimisesectionindices.filter({ (indices) -> Bool in
                return indices != button.tag
            })
            
            
        }
            
        else {
            
            button.isSelected = true
            button.setTitle("+", for: .selected)
            print("is selected")
            minimisesectionindices.append(button.tag)
            
        }
        
            myntraTableView.reloadSections([button.tag], with: .none)
    }
}


//MARK: extension UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout

extension MyntraVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagelist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
       // let cellcollection = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellID", for: indexPath) as! CollectionViewCell
       // if collectionindices.contains(indexPath) {
            
         //   let cellcollection = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
           // return cellcollection
        //}
        //else {
    
        if let cell = collectionindices[indexPath] {
            
            return cell
            
        }
        else {
        
        let cellcollection = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellID", for: indexPath) as! CollectionViewCell
//        if favouriteindices.contains(indexPath) && collectionindices.contains(indexPath) {
//           cellcollection.favouriteButton.isSelected = true
//            cellcollection.favouriteButton.addTarget(self, action: #selector(self.favButtonTapped), for: .touchUpInside)
//            print(indexPath)
//            
//        }
//        else {
//            cellcollection.favouriteButton.isSelected = false
//            cellcollection.favouriteButton.addTarget(self, action: #selector(self.favButtonTapped), for: .touchUpInside)
//        }
        if let url = URL(string: imagelist[indexPath.item].previewURL){
            cellcollection.collectionCellImage.af_setImage(withURL : url)  }
            cellcollection.backgroundColor = UIColor.getRandomColor
            cellcollection.favouriteButton.addTarget(self, action: #selector(self.favButtonTapped), for: .touchUpInside)
            collectionindices[indexPath] = cellcollection
        print("indexpath item=>\(indexPath.item)")
        print("indexpathrow=>\(indexPath.row)")
        return cellcollection
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
   
      //  }
    }
    
//MARK: Favourite button tapping
    func favButtonTapped(button : UIButton) {
        
        let cellofcollection = button.cellforcollectionview as! CollectionViewCell
        let celloftable = button.cellfortableview as! TableViewCell
        let indexofcell = celloftable.viewOfCollection.indexPath(for: cellofcollection)
        if button.isSelected {
            button.isSelected = false
            cellofcollection.favourite = .no
            favouriteindices = favouriteindices.filter({ (indices) -> Bool in
                return indices != indexofcell
            })
            print(cellofcollection)
            
            
            }
        else{
            button.isSelected = true
            cellofcollection.favourite = .yes
            favouriteindices.append(indexofcell!)
            print(cellofcollection)
            
    
        }
        
    }
    
}


//extension MyntraVC {
////    
//    func numberofrows() {
//        typesofcars = []
//        Webservices().fetchDataFromPixabay(withQuery: "cars", success: { (images : [ImageInfo]) in
//            
//            self.imagelist = images
//            //self.myntraTableView.reloadData()
//            
//        }) { (error : Error) in
//            
//            print(error)
//            
//        }
//
//        for indices in 0...imagelist.count{
//            typesofcars.append(imagelist[indices].tag)
//            
//        }
//
//        
//    }
//    
//}


//        typesofcars = imagelist.filter({ (imageinfo) -> Bool in
//             typesofcars.append(imageinfo.tag)
//            return true
//        })
       //
     
       
//    
//

//
//
