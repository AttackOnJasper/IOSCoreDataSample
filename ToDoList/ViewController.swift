//
//  ViewController.swift
//  ToDoList
//
//  Created by Jasper Wang on 8/8/16.
//  Copyright © 2016 Jasper Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource   {
    @IBAction func addAction(sender: AnyObject) {
        let alert = UIAlertController(title: "New Thing To Do",
                                      message: "What needs to do today",
                                      preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save",
                                       style: .Default,
                                       handler: { (action:UIAlertAction) -> Void in
                                        
                                        let textField = alert.textFields!.first
                                        self.actions.append(textField!.text!)
                                        self.tableView.reloadData()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .Default) { (action: UIAlertAction) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler {
            (textField: UITextField) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert,
                              animated: true,
                              completion: nil)
    }

    @IBOutlet weak var tableView: UITableView!
    
    var actions = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "To Do List"
        tableView.registerClass(UITableViewCell.self,forCellReuseIdentifier: "Cell")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - UITableViewDataSource
    func tableView(tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return actions.count
    }
    
    func tableView(tableView: UITableView,
                   cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell =
            tableView.dequeueReusableCellWithIdentifier("Cell")
        
        cell!.textLabel!.text = actions[indexPath.row]
        
        return cell!
    }

}

