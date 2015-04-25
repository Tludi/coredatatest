//
//  LogItem.swift
//  
//
//  Created by Timothy Ludi on 4/23/15.
//
//

import Foundation
import CoreData

class LogItem: NSManagedObject {

    @NSManaged var title: String
    @NSManaged var itemText: String
  
    // Create a class function that inserts an object into LogItem in CoreData managed context
    class func createInManagedObjectContext(moc: NSManagedObjectContext, title: String, text: String) -> LogItem {
      // create a newItem from inserted data and return
      let newItem = NSEntityDescription.insertNewObjectForEntityForName("LogItem", inManagedObjectContext: moc) as! LogItem
      newItem.title = title
      newItem.itemText = text
      
      return newItem
    }

}
