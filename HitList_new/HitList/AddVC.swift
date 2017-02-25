//
//  AddVC.swift
//  HitList
//
//  Created by Rajat Dhasmana on 24/02/17.
//  Copyright © 2017 Razeware. All rights reserved.
//

import UIKit
import CoreData




class AddVC: UIViewController {

    var people : [Person] = []
  
  var selectedIndex = IndexPath()
  
  var index = [IndexPath]()
  
  var selectedmode : mode = .add
  
  var selectedperson = Person()
    
    
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var screenLabel: UILabel!

    @IBOutlet weak var addTableView: UITableView!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
        if self.selectedmode == .view {
            
            saveButton.isHidden = true
            
        }
        addTableView.dataSource = self
        addTableView.delegate = self
      addTableView.allowsSelection = false
      
        
            editButton.setTitle("DONE", for: .selected)
        
            editButton.setTitle("EDIT", for: .normal)
      
      
        if selectedmode == .add {
            self.screenLabel.text = "ADD"
        }
            
            else {
                self.screenLabel.text = "Profile"
            
            addTableView.isUserInteractionEnabled = false
                
            }
            
}
    
  
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
      

      
      
      if selectedmode == .add {
      
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return
        }
      
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Person",
                                              in: managedContext)!
      
      
        let person = Person(entity: entity,
                          insertInto: managedContext)
      
      
        for indices in index.indices {
        
            guard let celloftable = addTableView.cellForRow(at: index[indices]) as? EditCell else {   fatalError("not found") }
        
        
            switch indices{
                    case 0: person.name = celloftable.detailTextField.text
            
                    case 1: person.email = celloftable.detailTextField.text
            
                    case 2: person.mobile = Int64(celloftable.detailTextField.text!)!
          
                    case 3: person.gender = celloftable.detailTextField.text
                  
                    default:      fatalError("row not found")
            
            }
        
      }
  
      
      
    
    
      do {
        try managedContext.save()
        
          let homecontroller = self.storyboard?.instantiateViewController(withIdentifier: "HomeVCID") as! HomeVC
        homecontroller.people.append(person)
        self.navigationController?.popViewController(animated: true)
        
        //people.append(person)
        
          } catch let error as NSError {
        
        print("Could not save. \(error), \(error.userInfo)")
        
        }
        
    
   }
      
//      if selectedmode == .edit {
//       
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//          return
//        }
//        
//        let managedContext = appDelegate.persistentContainer.viewContext
//
//        
//        for indices in index.indices {
//          
//          guard let celloftable = addTableView.cellForRow(at: index[indices]) as? EditCell else {   fatalError("not found") }
//          
//          
//          
//          switch indices{
//          case 0: selectedperson.name = celloftable.detailTextField.text
//            
//          case 1: selectedperson.email = celloftable.detailTextField.text
//            
//          case 2: selectedperson.mobile = Int64(celloftable.detailTextField.text!)!
//            
//          case 3: selectedperson.gender = celloftable.detailTextField.text
//            
//          default:      fatalError("row not found")
//            
//          }
//          
//        }
//        
//        appDelegate.saveContext()
//        
//
//        
//        
//      }
  }
  
  
  

    @IBAction func editButtonTapped(_ sender: UIButton) {
       
        
        if sender.isSelected {
            
            sender.isSelected = false
            
            saveButton.isHidden = true
          
          
          guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
          }
          
          let managedContext = appDelegate.persistentContainer.viewContext
          
          
          for indices in index.indices {
            
            guard let celloftable = addTableView.cellForRow(at: index[indices]) as? EditCell else {   fatalError("not found") }
            
            
            
            switch indices{
            case 0: selectedperson.name = celloftable.detailTextField.text
              
            case 1: selectedperson.email = celloftable.detailTextField.text
              
            case 2: selectedperson.mobile = Int64(celloftable.detailTextField.text!)!
              
            case 3: selectedperson.gender = celloftable.detailTextField.text
              
            default:      fatalError("row not found")
              
            }
            
          }
          
          appDelegate.saveContext()
          

          
          
        addTableView.isUserInteractionEnabled = false
        selectedmode = .view
        
        }
        else {
            
            sender.isSelected = true
            saveButton.isHidden = true
            selectedmode = .edit
            addTableView.isUserInteractionEnabled = true
            //addTableView.reloadData()

          
            
        }
        
        
    
    }



}



extension AddVC : UITableViewDataSource , UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return 4
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "EditCellID", for: indexPath) as? EditCell else {
      
      fatalError("not found")
    
    }
    
    
     self.index.append(indexPath)
  
    if selectedmode == .add {
   
    switch indexPath.row {
        
    case 0: cell.titleLabel.text = "NAME"
      
    case 1: cell.titleLabel.text = "Email"
      
    case 2: cell.titleLabel.text = "Mobile"
            cell.detailTextField.keyboardType = .numberPad
      
    case 3: cell.titleLabel.text = "Gender"
    
    default : fatalError("not found")
        
    }
    
    }
    
    else {
      

      
      switch indexPath.row {
        
      case 0: cell.titleLabel.text = "NAME"
              cell.detailTextField.text = selectedperson.name
        
      case 1: cell.titleLabel.text = "Email"
              cell.detailTextField.text = selectedperson.email
        
      case 2: cell.titleLabel.text = "Mobile"
              cell.detailTextField.text = String(selectedperson.mobile)
        
      case 3: cell.titleLabel.text = "Gender"
              cell.detailTextField.text = selectedperson.gender
        
      default : fatalError("not found")
        
      }
      

      
    }
    
        
     return cell
    
 
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 50
 
  
  }
  
  
}


class EditCell : UITableViewCell {
  
  
    @IBOutlet weak var titleLabel: UILabel!
  
    @IBOutlet weak var detailTextField: UITextField!
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}

