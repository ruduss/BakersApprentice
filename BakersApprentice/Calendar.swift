//
//  Calendar.swift
//  BakersApprentice
//
//  Created by nicole ruduss on 17/04/2016.
//  Copyright © 2016 Bookatable. All rights reserved.
//

import UIKit

private let _CalendarSharedInstance = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!

class Calendar: NSCalendar {
    class var sharedInstance: NSCalendar {
        return _CalendarSharedInstance
    }
}