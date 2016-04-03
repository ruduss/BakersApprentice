//
//  File.swift
//  BakersApprentice
//
//  Created by nicole ruduss on 03/04/2016.
//  Copyright © 2016 Bookatable. All rights reserved.
//

import UIKit

class Timer : NSObject {

    var id: Int
    var name: String
    var start: NSDate
    var end: NSDate
    
    override init() {
        self.id = 1
        self.name = ""
        self.start = NSDate()
        self.end = NSDate()
    }

}
