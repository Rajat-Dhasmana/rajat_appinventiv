//
//  Webservices.swift
//  TableCollectionPractice
//
//  Created by Rajat Dhasmana on 22/02/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import Foundation
import SwiftyJSON

class Webservices {
    
    func fetchDataFromPixabay(withQuery query: String,
                              page : Int ,
                              success : @escaping (([ImageInfo]) -> Void),
                              failure : @escaping ((Error) -> Void)) {
        
            let URL = "https://pixabay.com/api/"
        
            let parameters = ["key" : "4609035-606b3dfa9bfab097d00eaf045",
                              "q" : query,
                              "page" : page
                ] as [String : Any]
        
            NetworkController().GET(URL: URL,
                                    parameters : parameters,
                                    success : { (json : JSON) in
                                    
                                                print(json)
                                    
                                            let imagesArray = json["hits"].arrayValue
                                    
                                            var imageModels = [ImageInfo]()
                                    
                                            for image in imagesArray {
                                        
                                                imageModels.append(ImageInfo(withJSON: image))
                                            }
                                    
                                            success(imageModels)
                                    
        }, failure : { (error : Error) in
            
            failure(error)
        })
        
    }
    
}
