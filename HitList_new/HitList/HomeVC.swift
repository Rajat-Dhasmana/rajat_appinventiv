
import UIKit
import CoreData


class HomeVC: UIViewController {

  
    @IBOutlet weak var personTableView: UITableView!
  
    
  
  var people: [Person] = []
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()

    title = "The List"
  
    self.personTableView.dataSource = self
    self.personTableView.delegate = self
  
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    

    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
      return
    }

    let managedContext = appDelegate.persistentContainer.viewContext

    let fetchRequest : NSFetchRequest<Person> = Person.fetchRequest()
    
    do {
      
      people = try managedContext.fetch(fetchRequest)
      
    } catch let error as NSError {
      
      print("Could not fetch. \(error), \(error.userInfo)")
    
    }
  
    personTableView.reloadData()
    
  }

  @IBAction func addName(_ sender: UIBarButtonItem) {
    

    let addViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddVCID") as! AddVC
    addViewController.selectedmode = mode.add
    self.navigationController?.pushViewController(addViewController, animated: true)
    

  }
  
    
}


// MARK: - UITableViewDataSource
extension HomeVC: UITableViewDataSource , UITableViewDelegate {

  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    return people.count
  }

  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let person = people[indexPath.row]
   guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCellID",
                                                  for: indexPath) as? HomeCell else {
    fatalError("not found")
    }
    
    cell.titleLabel?.text = person.name
    
    return cell
 
  }
  
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    
          let editViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddVCID") as! AddVC
          editViewController.selectedmode = .view
          editViewController.selectedperson = people[indexPath.row]
          self.navigationController?.pushViewController(editViewController, animated: true)
    

    
  }
  
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
   
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
      return
    }
    
    let managedContext = appDelegate.persistentContainer.viewContext

    
    switch editingStyle {
      case .delete:
        
          let person = people[indexPath.row]
          managedContext.delete(person)
        
          people.remove(at: indexPath.row)
          do {
              try managedContext.save()
          
            
          } catch let error as NSError {
            
              print("Could not save. \(error), \(error.userInfo)")
          
            
            }
              tableView.reloadData()
      
    default:  fatalError("not found")
  
    }
  
    self.personTableView.reloadData()
    
  }
  
  
}


class HomeCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  override func prepareForReuse() {
    super.prepareForReuse()
  }
  
}

