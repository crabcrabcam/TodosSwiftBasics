//
//  DetailViewController.swift
//  Todos
//
//  Created by Stephen Radford on 09/08/2016.
//  Copyright © 2016 Cocoon Development Ltd. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var textView: UITextView!
    
    

    var todo: Todo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = todo.title
        textView.text = todo.description
        NSNotificationCenter.defaultCenter().addObserverForName(UITextViewTextDidChangeNotification, object: textView, queue: nil) { (notification) in
            self.saveButton.enabled = true
            
        }
    }
    
    @IBAction func SavePressed(sender: AnyObject) {
        
        let textViewText: String = textView.text
        todo.description = textViewText
        saveButton.enabled = false
        let AC = UIAlertController(title: "Saved", message: "This item has been saved", preferredStyle: .Alert)
        
        AC.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(AC, animated: true, completion: nil)
        
        
    }
}


