//
//  ImageSearchVC.swift
//  ImageSearch
//
//  Created by Rajat Dhasmana on 21/02/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit
import AlamofireImage

//MARK: View Controller Class

class ImageSearchVC: UIViewController {
    
//MARK: IBOutlets

    @IBOutlet weak var imageTableView: UITableView!
    
    
    @IBOutlet weak var imageSearchBar: UISearchBar!
    
    
    var imagelist = [ImageInfo]()

//MARK: App LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.imageTableView.dataSource = self
        self.imageTableView.delegate = self
        let nib1 = UINib(nibName: "ImageCell", bundle: nil)
        self.imageTableView.register(nib1, forCellReuseIdentifier: "ImageCellID")
        self.imageSearchBar.delegate = self

    }

   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK: Extension UITableViewDelegate , UITableViewDataSource

extension ImageSearchVC : UITableViewDelegate , UITableViewDataSource {
   
//NUmber of rows
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return imagelist.count
    
    }
    
//returning cell for row
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCellID", for: indexPath) as? ImageCell else {
            
            fatalError("Cell Not Found")
        }
        
        if let url = URL(string: imagelist[indexPath.row].webformatURL) {
            
            print(url)
           
            cell.searchedImage.af_setImage(withURL : url)
            
        }
        

        return cell

    }
    
//Height for row
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
//DidSelect Row
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? ImageCell else {
            
            fatalError("cell not found")
        
        }
        
        let image = cell.searchedImage.image
        
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewImageVC") as! ViewImageVC
        
        secondViewController.imagereceived = image!
        
        self.navigationController?.pushViewController(secondViewController, animated: true)
        
    }
}

//MARK: Extension UISearchBarDelegate

extension ImageSearchVC : UISearchBarDelegate {

//searchbar button tapped
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
//MARK: Fetch Data
       
        Webservices().fetchDataFromPixabay(withQuery: searchBar.text!,
                                           success: { (images : [ImageInfo]) in
        
                                                        self.imagelist = images
            
                                                        self.imageTableView.reloadData()
        
                                                    }) { (error : Error) in
        
                                                            print(error)
        
        }
        
        searchBar.endEditing(true)
        
        imageTableView.reloadData()
        
    }
    
    
}
