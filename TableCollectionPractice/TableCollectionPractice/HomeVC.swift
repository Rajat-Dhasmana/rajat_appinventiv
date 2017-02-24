//
//  HomeVC.swift
//  TableCollectionPractice
//
//  Created by Rajat Dhasmana on 22/02/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit
import AlamofireImage
//MARK: Main Class
class HomeVC: UIViewController {
    
//MARK: IBOutlets and Variables
    
    @IBOutlet weak var mainTableView: UITableView!
    
    var minimisetableindices = [IndexPath]()
    
    var minimisesectionindices = [Int]()
   
    var favouriteindices = [[IndexPath]]()
    
    var imagelist = [[[ImageInfo]]]()
    
    var itemsArray = [
        
        ["cars" : ["bmw" , "audi" , "lamborghini"]],
        ["bikes" : ["bmw" , "audi" , "lamborghini"]],
        ["trucks" : ["bmw" , "audi" , "lamborghini"]]
    
    ]
        
//MARK: App Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        self.automaticallyAdjustsScrollViewInsets = false
       
        fetchData()
    
        
        let cellNib1 = UINib(nibName: "TableCell", bundle: nil)
        
        mainTableView.register(cellNib1, forCellReuseIdentifier: "TableCellID")
        
        let cellNib3 = UINib(nibName: "HeaderView", bundle: nil)
        
        mainTableView.register(cellNib3, forHeaderFooterViewReuseIdentifier: "HeaderViewID")
        
           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
       }
    
    func fetchData() {
        
        var count = 1
        for sections  in itemsArray.indices{
            
            imagelist.append([])
            
            for index in itemsArray {
                 for indices in 0...index.count {
                    for i in 0...index[indices].count {
                
                Webservices().fetchDataFromPixabay(withQuery: itemsArray[indices]["cars"][0],
                                                   page: count,
                                                   success: { (images : [ImageInfo]) in
                                                    self.imagelist[sections].append(images)
                                                    print("hittttt")
                                                    self.mainTableView.reloadData()
                })
                { (error : Error) in
                    print(error)
                }
                }
                }
                count += 1
            }
        }


    }
    
}


//MARK: extension UITableViewDataSource , UITableViewDelegate

extension HomeVC : UITableViewDataSource , UITableViewDelegate  {
    
    func numberOfSections(in tableView: UITableView) -> Int {
           return imagelist.count   }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if minimisesectionindices.contains(section) {
            return 0
        }
        else {
            return imagelist[section].count
        }
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let celltable = tableView.dequeueReusableCell(withIdentifier: "TableCellID", for: indexPath) as? TableCell else {
            
            fatalError("not found")
        }
        
       
        celltable.collectView.dataSource = self
        celltable.collectView.delegate = self
        
        let cellnib2 = UINib(nibName:"CollectionCell", bundle: nil)
        
        
        celltable.collectView.register(cellnib2, forCellWithReuseIdentifier: "CollectionCellID")
        celltable.tableindexpath = indexPath
        celltable.tableCellMinimiseButton.addTarget(self, action: #selector(self.tableCellMinimiseButtonTapped), for: .touchUpInside)
        return celltable
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            
        if minimisetableindices.contains(indexPath) {
            return 39
        }
        else {
            return 160
        }

    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let headerobject = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderViewID") as? HeaderView else { fatalError("Header Not Found") }
        
        headerobject.headerLabel.text = "section"
        headerobject.contentView.backgroundColor = UIColor.gray
        headerobject.minimiseSectionButton.addTarget(self, action: #selector(self.minimiseSectionButtonTapped), for: .touchUpInside)
        headerobject.minimiseSectionButton.tag =  section
        headerobject.minimiseSectionButton.setTitle("+", for: .selected)
        headerobject.minimiseSectionButton.backgroundColor = UIColor.gray
        if minimisesectionindices.contains(section) {
            headerobject.minimiseSectionButton.isSelected = true
        }
        else {
            
            headerobject.minimiseSectionButton.isSelected = false
        }

        return headerobject

    }
    
    
    func tableCellMinimiseButtonTapped(button : UIButton) {
        
        guard let cell = button.cellfortableview as? TableCell else{
            fatalError()
        }
        
        let celloftable = cell
        
        
        if button.isSelected {
            button.isSelected = false
            button.setTitle("-", for: .normal)
            print("is not selected")
            minimisetableindices = minimisetableindices.filter({ (indices) -> Bool in
                return indices != celloftable.tableindexpath
            })
            
            mainTableView.reloadRows(at: minimisetableindices, with: .none)
        }
            
        else {
            
            button.isSelected = true
            button.setTitle("+", for: .selected)
            print("is selected")
            minimisetableindices.append(celloftable.tableindexpath!)
            mainTableView.reloadRows(at: minimisetableindices, with: .none)
        }
        
    }

    

//MARK: MINIMISE SECTION BUTTON TAPPED
    
    func minimiseSectionButtonTapped(button: UIButton) {
        
        
        if button.isSelected {
           button.setTitle("-", for: .normal)
            button.isSelected = false
            
            print("is not selected")
            minimisesectionindices = minimisesectionindices.filter({ (indices) -> Bool in
                return indices != button.tag
            })
            
            
        }
            
        else {
            button.setTitle("+", for: .selected)
            button.isSelected = true
            
            print("is selected")
            minimisesectionindices.append(button.tag)
            
        }
        
        mainTableView.reloadSections([button.tag], with: .none)
    }




}

//MARK: extension UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout

extension HomeVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
  
//.......................NUMBER OF ITEMS IN SECTION......................................................................
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        let celloftable = collectionView.cellfortableview as! TableCell
        
        return imagelist[celloftable.tableindexpath.section][celloftable.tableindexpath.row].count
    }
    
    
//.......................CELL FOR ITEM IN COLLECTION VIEW..................................................................
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        guard let cellcollection = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCellID", for: indexPath) as? CollectionCell else {
            
            fatalError("not found")
        }
        
        guard let celloftable = collectionView.cellfortableview as? TableCell else {  fatalError("not found")  }
      
        if favouriteindices.contains(where: { (indices : [IndexPath]) -> Bool in
        
            return indices == [(celloftable.tableindexpath) , indexPath]
        })
        
        {
        
            cellcollection.favouriteButton.isSelected = true
        
        }
        else {
            cellcollection.favouriteButton.isSelected = false
            
        }
        
        let tableCell = collectionView.cellfortableview as! TableCell
        
        cellcollection.favouriteButton.addTarget(self, action: #selector(self.favouriteButtonTapped), for: .touchUpInside)
       
        cellcollection.collectionindexpath = indexPath
        
        let data = imagelist[tableCell.tableindexpath.section][tableCell.tableindexpath.row][indexPath.item]
        
        if let url = URL(string: data.previewURL) {
        
            cellcollection.cellImage.af_setImage(withURL: url)
            
        }
        
        if let urlhdimage = URL(string: data.webformatURL) {
            
            cellcollection.hdimage.af_setImage(withURL: urlhdimage)
            
        }

        
        return cellcollection
    
    }
    
//............................................SIZE OF ITEM IN COLLECTION.................................................
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 100, height: 100)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CollectionCell else {
        
            fatalError("not found")
        
        }
        
        let image  = cell.hdimage.image
        let secondviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "ImageViewVCID") as! ImageViewVC
        secondviewcontroller.imagereceived = image
        self.navigationController?.pushViewController(secondviewcontroller, animated: true)
    }

//MARK: FAVOURITE BUTTON TAPPED
    
    func favouriteButtonTapped(button: UIButton) {
        
        let cellofcollection = button.cellforcollectionview as! CollectionCell
        let celloftable = button.cellfortableview as! TableCell
        if button.isSelected {
            button.isSelected = false
            
                favouriteindices = favouriteindices.filter({ (indices: [IndexPath]) -> Bool in
                return indices != [celloftable.tableindexpath,cellofcollection.collectionindexpath]
            })

                print(favouriteindices)
                
        }
        else{
            button.isSelected = true
          
                favouriteindices.append([celloftable.tableindexpath , cellofcollection.collectionindexpath])
        }
        
    }

}






