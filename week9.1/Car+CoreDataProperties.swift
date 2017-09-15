//
//  Car+CoreDataProperties.swift
//  week9.1
//
//  Created by Appzoc on 10/08/17.
//  Copyright © 2017 appzoc. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Car {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: "Car");
    }

    @NSManaged public var car_name: String?
    @NSManaged public var car_price: String?
    @NSManaged public var car_model: String?

}
