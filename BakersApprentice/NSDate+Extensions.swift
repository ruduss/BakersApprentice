//
//  NSDate+Extensions.swift
//  BakersApprentice
//
//  Created by nicole ruduss on 03/04/2016.
//  Copyright © 2016 Bookatable. All rights reserved.
//

import UIKit

public extension NSDate
{
    func toUtcString() -> String {
        let dateStringFormatter = DateFormatter.sharedInstance
        dateStringFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        return dateStringFormatter.stringFromDate(self)
    }
    
    func addDays(daysToAdd: Int) -> NSDate {
        let calendar = Calendar.currentCalendar()
        let date = calendar.dateByAddingUnit(.Day, value: daysToAdd, toDate: self, options: [])
        return date!
    }
    
    func addHours(hoursToAdd: Int) -> NSDate {
        let calendar = Calendar.currentCalendar()
        let date = calendar.dateByAddingUnit(.Hour, value: hoursToAdd, toDate: self, options: [])
        return date!
    }
    
    func addMinutes(minutesToAdd: Int) -> NSDate {
        let calendar = Calendar.currentCalendar()
        let date = calendar.dateByAddingUnit(.Minute, value: minutesToAdd, toDate: self, options: [])
        return date!
    }
}
