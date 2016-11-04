//
//  CreateViewController.swift
//  Todos
//
//  Created by Stephen Radford on 09/08/2016.
//  Copyright © 2016 Cocoon Development Ltd. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {

    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var todoTitle: UITextField!
    
    @IBOutlet weak var todoDescription: UITextField!

    var delegate: AppDelegate {
        return UIApplication.sharedApplication().delegate as! AppDelegate
    }
    
    @IBAction func cancelTapped(sender: AnyObject) {
        
        if saveButton.enabled{
        let AC = UIAlertController(title: "Cancel?", message: "Are you sure?", preferredStyle: .Alert)
        AC.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.Destructive, handler: { (action) in
            self.dismissViewControllerAnimated(true, completion: nil)
        }))
        AC.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(AC, animated: false, completion: nil)
        }
        else{
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }

    @IBAction func saveTapped(sender: AnyObject) {
        let tableView = (presentingViewController!.childViewControllers[0] as! TodoTableViewController).tableView
        
        if let title = todoTitle.text, let description = todoDescription.text {
            let todo = Todo(title: title, description: description)
            delegate.todos.append(todo)
            dismissViewControllerAnimated(true) {
               tableView.reloadData()
            }
        }
    }
    
    @IBAction func valueChanged(sender: AnyObject) {
        
        print(todoTitle.text)
        
        if todoTitle.text != ""{
            saveButton.enabled = true
        }
        else{
            saveButton.enabled = false
        }
    }
    
}
