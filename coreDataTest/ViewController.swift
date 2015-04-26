//
//  ViewController.swift
//  coreDataTest
//
//  Created by Timothy Ludi on 4/23/15.
//  Copyright (c) 2015 Timothy Ludi. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  var logItems = [LogItem]()
  
  let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
  
  var logTableView = UITableView(frame: CGRectZero, style: .Plain)
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return logItems.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("LogCell", forIndexPath: indexPath) as! UITableViewCell
    
    // get the logItems from the fetchLog() method
    let logItem = logItems[indexPath.row]
    cell.textLabel?.text = logItem.title
    return cell
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    fetchLog()
    
    if let moc = self.managedObjectContext {
      // create some dummy data
      // create an arra of items holding tuples of data
      var items = [
        ("these", "are those"),
        ("this", "is that"),
        ("those", "are these")
      ]
      
      // Loop through items creating each item
      for (itemTitle, itemText) in items {
        // create individual item
        LogItem.createInManagedObjectContext(moc, title: itemTitle, text: itemText)
      }
      // store the full frame in a temporary variable
      var viewFrame = self.view.frame
      // adjust the frame down by 20 points
      viewFrame.origin.y += 20
      // reduce the frame height by 20 points
      viewFrame.size.height -= 20
      // set the logTabelView's frame equal to the temporary frame
      // adjusted to account for the status bar height
      logTableView.frame = viewFrame
      // add the table view to this view controllers view
      self.view.addSubview(logTableView)
      // tell the controller which cell to reuse on the table
      logTableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "LogCell")
      
      logTableView.dataSource = self
      logTableView.delegate = self
    }
  }
  
  // get the items from the LogItem database
  func fetchLog() {
    let fetchRequest = NSFetchRequest(entityName: "LogItem")
    if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [LogItem] {
      logItems = fetchResults
    }
  }
  
  func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
    let logItem = logItems[indexPath.row]
    println(logItem.itemText)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    
    // create a new fetch request using the LogItem entity in CoreData
    let fetchRequest = NSFetchRequest(entityName: "LogItem")
    
    // Execute the fetch request and cast the results to an array of LogItem objetcts
    if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [LogItem] {
      
      // Create an Alert and set its message to whatever the itemText is
      //let alert = UIAlertController(title: fetchResults[0].title, message: fetchResults[0].itemText, preferredStyle: .Alert)
      
      // Display the alert
      //self.presentViewController(alert, animated: true, completion: nil)
    }
    
  }


}

