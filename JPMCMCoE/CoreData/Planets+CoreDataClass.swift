//
//  Planets+CoreDataClass.swift
//  JPMCMCoE
//
//  Created by Sajid Hasan on 14/06/2022.
//
//

import UIKit
import CoreData


public class Planet: NSManagedObject {
    
    let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
    
    func createEntity<T: NSManagedObject>(_ type: T.Type) -> T?{
        guard let entityName = T.entity().name else { return }
        guard let entity = NSEntityDescription.entity(forEntityName: entityName, in: context)
        
    }
    
    
}
