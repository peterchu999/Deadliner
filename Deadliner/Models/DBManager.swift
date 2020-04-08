//
//  DBManager.swift
//  Deadliner
//
//  Created by Muhammad Nobel Shidqi on 07/04/20.
//  Copyright © 2020 Muhammad Nobel Shidqi. All rights reserved.
//

import Foundation
import CoreData

enum DataType {
    case category
    case activity
}

struct DBManager {
    
    let context = AppDelegate.singleton.persistentContainer.viewContext
    
    mutating func fetchData(for dataType: DataType, withPredicate predicate: NSPredicate? = nil) -> [NSManagedObject]?{
        var request: NSFetchRequest<NSManagedObject>!
        var results: [NSManagedObject]?
        switch dataType {
            case .activity:
                request = NSFetchRequest(entityName: DBK.activityEntityName)
            case .category:
                request = NSFetchRequest(entityName: DBK.categoryEntityName)
        }
        request.predicate = predicate
        
        do {
            results = try context.fetch(request)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        results = (results!.count == 0) ? nil : results
        return results
    }
    
    func save() {
        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func remove(object: NSManagedObject) {
        context.delete(object)
        save()
    }
    
}
