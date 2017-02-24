//
//  FavouritesListVC.swift
//  CoreDataFirst
//
//  Created by Rajat Dhasmana on 24/02/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit
import CoreData

class FavouritesListVC: UIViewController {

    
    @IBOutlet weak var favouriteListTableView: UITableView!
    
    var people = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Person")
        

        do {
            people = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        print(people)
        
        self.favouriteListTableView.dataSource = self
        //self.favouriteListTableView.delegate = self
        title = "FAVOURITES LIST"
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
    
        let alert = UIAlertController(title: "New Name", message: "Add New Name", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "SAVE", style: .default) { [unowned self] action in
            
            guard let inputField = alert.textFields?.first,
            let nametosave = inputField.text else {
                
                return
            }
            self.save(name: nametosave)
            self.favouriteListTableView.reloadData()
        }
    
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert , animated: true)
    }
    
    
    func save(name : String) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: managedContext)
        
        let person = NSManagedObject(entity: entity! , insertInto: managedContext)
        
        person.setValue(name, forKey: "name")
        
        do {
            try managedContext.save()
            people.append(person)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        
    }
    
    
}

extension FavouritesListVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NameCellID", for: indexPath) as? NameCell else{fatalError("error")}
        
        let person = people[indexPath.row]
        cell.textLabel?.text = person.value(forKey: "name") as! String?
        
        return cell
    }
    
}



class NameCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}

