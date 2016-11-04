//
//  Todo.swift
//  Todos
//
//  Created by Stephen Radford on 09/08/2016.
//  Copyright © 2016 Cocoon Development Ltd. All rights reserved.
//

import Foundation


/**
 *  The main Todo model
 */
class Todo {
    
    /// The title of the Todo
    var title: String
    
    /// The description of the Todo
    var description: String
    
    init(title: String, description: String){
        self.title = title
        self.description = description
        
    }
    
}