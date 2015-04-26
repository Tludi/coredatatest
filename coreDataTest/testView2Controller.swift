//
//  testView2Controller.swift
//  coreDataTest
//
//  Created by Timothy Ludi on 4/25/15.
//  Copyright (c) 2015 Timothy Ludi. All rights reserved.
//

import UIKit

class testView2Controller: UIViewController, UITableViewDataSource {

  
  var items = ["this", "that", "these", "those", "oot"]
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCellWithIdentifier("firstcell", forIndexPath: indexPath) as! UITableViewCell
    var item = items[(indexPath.row)]
    // use a custom label with tags instead of the textlabel of the basic style
    if let nameLabel = cell.viewWithTag(100) as? UILabel {
      nameLabel.text = item
    }
    //cell.textLabel?.text = item
    return cell
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
