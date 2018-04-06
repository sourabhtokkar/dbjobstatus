//
//  LocationModel.swift
//  database
//
//  Created by sourabh on 2/26/18.
//  Copyright © 2018 sourabh. All rights reserved.
//

import UIKit

class LocationModel: NSObject {
    
    var Subject: String?
    var Message: String?

    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(Subject: String, Message: String) {
        
        self.Subject = Subject
        self.Message = Message

        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "Name: \(String(describing: Subject)), Address: \(Message)"
        
    }


}
