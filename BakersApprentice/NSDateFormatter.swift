//
//  NSDateFormatter.swift
//  BakersApprentice
//
//  Created by nicole ruduss on 03/04/2016.
//  Copyright © 2016 Bookatable. All rights reserved.
//

import UIKit

public extension NSDateFormatter
{
    func setUtcTimeZone() -> NSDateFormatter {
        self.timeZone = NSTimeZone(name: "UTC")
        return self
    }
    
    func setMyTimeZone(name: String) -> NSDateFormatter {
        self.timeZone = NSTimeZone(name: name)
        return self
    }
    
    func setMyDateFormat(dateFormat: String) -> NSDateFormatter {
        self.dateFormat = dateFormat
        return self
    }
    
    func setSafeDefaultLocale() -> NSDateFormatter {
        self.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        return self
    }
    
}