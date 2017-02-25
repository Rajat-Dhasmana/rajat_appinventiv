//
//  Person+CoreDataProperties.swift
//  HitList
//
//  Created by Rajat Dhasmana on 25/02/17.
//  Copyright © 2017 Razeware. All rights reserved.
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person");
    }

    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var mobile: Int64
    @NSManaged public var gender: String?

}
