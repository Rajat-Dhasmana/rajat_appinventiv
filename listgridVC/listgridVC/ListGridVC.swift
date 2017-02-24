//
//  ListGridVC.swift
//  listgridVC
//
//  Created by Mohd Sultan on 14/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class NameModel
{
    var name : String
    
    var imagecell : UIImage
    
    
    
    init(dict data : [String:Any]) {
        
        name = data["name"] as! String
        
        imagecell = data["imagename"] as! UIImage
        
    }
    
}

enum LayoutType {
    case grid
    case list
}
class ListGridVC: UIViewController , UIGestureRecognizerDelegate {
    var listLayout = ListLayout()
    var gridLayout = GridLayout()
    
//MARK: IBOutlets
    @IBOutlet weak var mainCollectionView: UICollectionView!
    @IBOutlet weak var listButton: UIButton!       
    @IBOutlet weak var gridButton: UIButton!
    @IBOutlet weak var noOfPhotosLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    var layouttype = LayoutType.grid
    
//MARK: Data Dictionary
    var names = [
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
    
    var selectedcell  = [IndexPath]()
    
//MARK: App Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        deleteButton.isHidden = true
        let longPress = UILongPressGestureRecognizer(target: self , action: #selector(selectCell))
        //longPress.delegate = self
        mainCollectionView.addGestureRecognizer(longPress)
        mainCollectionView.allowsSelection = false
        self.mainCollectionView.setCollectionViewLayout(self.gridLayout, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        }
    
//MARK: IBActions
    @IBAction func listButtonPressed(_ sender: UIButton) {
        layouttype = LayoutType.list
        UIView.animate(withDuration: 0.9) { () -> Void in
            self.mainCollectionView.collectionViewLayout.invalidateLayout()
            self.mainCollectionView.setCollectionViewLayout(self.listLayout, animated: true)
        }
    }
    
  @IBAction  func gridButtonPressed(_ sender: UIButton) {
        layouttype = LayoutType.grid
        
        UIView.animate(withDuration:0.9) { () -> Void in
            self.mainCollectionView.collectionViewLayout.invalidateLayout()
            self.mainCollectionView.setCollectionViewLayout(self.gridLayout, animated: true)
        }
        }

    @IBAction func deletePressed(_ sender: UIButton) {
  
//        print(selectedcell)
        mainCollectionView.allowsSelection = false
        let newArray = selectedcell.sorted(by: >)
        for index in newArray{
            names.remove(at: index.item)
            mainCollectionView.deleteItems(at:[index])
        }
//  mainCollectionView.deleteItems(at: selectedcell as! [IndexPath])
        gridButton.isHidden = false
        listButton.isHidden = false
        deleteButton.isHidden = true
        selectedcell = []
   //mainCollectionView.reloadData()
    }


}
//MARK: Extending with UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout

extension ListGridVC : UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{

    
//....................................No. Of Rows...................................
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return names.count
    
    }

//................................creating cell object................................
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let data = NameModel(dict : names[indexPath
                        .item])
        
        if layouttype == LayoutType.grid
        {
            
        let gridcell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCellID", for: indexPath) as! CollectionCell
            gridcell.configureCell(data: data)
            gridcell.isUserInteractionEnabled = true
            gridcell.backgroundColor = nil
            return gridcell
        
        }
        
        else
        {
            let listcell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCellID", for: indexPath) as! CollectionCell
            listcell.configureCell(data: data)
            listcell.isUserInteractionEnabled = true
            listcell.backgroundColor = nil
            return listcell

        }
    }
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
         let cell = self.mainCollectionView.cellForItem(at: indexPath)
         print("selected for indexPath \(indexPath)")
         cell?.backgroundColor = UIColor.black
         selectedcell.append(indexPath)
    }


    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath){
        let cell = self.mainCollectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.clear
        selectedcell.remove(at: selectedcell.index(of: indexPath)!)
    }

//MARK: Gesture Function
    
    func selectCell(gesture : UILongPressGestureRecognizer!){
        if gesture.state == .ended {
            return
        }
        mainCollectionView.allowsMultipleSelection = true
        deleteButton.isHidden = false
        deleteButton.isEnabled = true
        listButton.isHidden = true
        gridButton.isHidden = true
        let p = gesture.location(in: mainCollectionView)
        if let indexPath = mainCollectionView.indexPathForItem(at: p) {
            mainCollectionView.selectItem(at: indexPath, animated: false, scrollPosition: .top)
            collectionView(mainCollectionView, didSelectItemAt: indexPath)
            print("inside gesture")
        }
        else {
            print("couldn't find index path")
        }
        
    }
}

//MARK: Class for Cell
class CollectionCell : UICollectionViewCell
{


    @IBOutlet weak var cellImage: UIImageView!

    func configureCell(data : NameModel)
    {
    
        cellImage.image = data.imagecell
    
    }
}
