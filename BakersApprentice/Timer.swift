//
//  File.swift
//  BakersApprentice
//
//  Created by nicole ruduss on 03/04/2016.
//  Copyright © 2016 Bookatable. All rights reserved.
//

import UIKit

@objc protocol TimerProtocol {
    var name: String {get set}
    var start: NSDate {get set}
    var end: NSDate {get set}
}

class Timer : NSObject, TimerProtocol {

    var name: String
    var start: NSDate
    var end: NSDate
    
    init(name: String, start: NSDate, end: NSDate) {
        self.name = name
        self.start = start
        self.end = end
    }

}
