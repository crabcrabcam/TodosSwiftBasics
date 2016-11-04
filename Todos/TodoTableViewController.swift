//
//  TodoTableViewController.swift
//  Todos
//
//  Created by Stephen Radford on 09/08/2016.
//  Copyright © 2016 Cocoon Development Ltd. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {
    
    let backgroundColor = UIColor(red:0.00, green:0.72, blue:0.15, alpha:1.00)
    
    var delegate: AppDelegate {
        return UIApplication.sharedApplication().delegate as! AppDelegate
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return delegate.todos.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("todoCell")!
        cell.textLabel?.text = delegate.todos[indexPath.row].title
        return cell
    }
    
    // MARK: - Actions
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let action = UITableViewRowAction(style: .Default, title: "Complete", handler: { (action, indexPath) in
            self.delegate.todos.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            
        })
        
        action.backgroundColor = backgroundColor
        
        return [action]
    }
    
    
    
    // MARK: - Seque
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let detailView = segue.destinationViewController as? DetailViewController {
            detailView.todo = delegate.todos[tableView.indexPathForSelectedRow!.row]
        }
    }
    
}
