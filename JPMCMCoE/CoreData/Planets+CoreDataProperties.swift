//
//  Planets+CoreDataProperties.swift
//  JPMCMCoE
//
//  Created by Sajid Hasan on 14/06/2022.
//
//

import Foundation
import CoreData


extension Planet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Planet> {
        return NSFetchRequest<Planet>(entityName: "Planet")
    }

    @NSManaged public var name: String?

}

extension Planet : Identifiable {

}
