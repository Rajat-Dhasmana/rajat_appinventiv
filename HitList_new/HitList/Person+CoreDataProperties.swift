//
//  Person+CoreDataProperties.swift
//  HitList
//
//  Created by Gurdeep on 24/02/17.
//  Copyright © 2017 Razeware. All rights reserved.
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person");
    }

    @NSManaged public var name: String?

}
