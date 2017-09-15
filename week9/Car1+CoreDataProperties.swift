//
//  Car1+CoreDataProperties.swift
//  week9
//
//  Created by Appzoc on 11/08/17.
//  Copyright © 2017 appzoc. All rights reserved.
//

import Foundation
import CoreData


extension Car1 {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car1> {
        return NSFetchRequest<Car1>(entityName: "Car1");
    }

    @NSManaged public var car_name: String?
    @NSManaged public var car_price: String?
    @NSManaged public var car_model: String?

}
