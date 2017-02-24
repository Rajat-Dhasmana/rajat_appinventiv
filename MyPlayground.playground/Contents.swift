//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


var items = [

    ["cars" : ["bmw" , "audi"]],
    ["bikes" : ["bmw" , "audi"]]

]

for index in items {
    
    for indices in 0...index.count {
        
        print(items[indices]["cars"])
        
    }
    
}

//var data = ["cars" , "bikes" , "trucks"]
//
//for index in data {
//    
//    print(index)
//}
//





print(items.count)

//for index in items {
//    
//    print(index["cars"]!)
//}
