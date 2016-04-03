//
//  DateFormatter.swift
//  BakersApprentice
//
//  Created by nicole ruduss on 03/04/2016.
//  Copyright © 2016 Bookatable. All rights reserved.
//

import UIKit

private let _DateFormatterSharedInstance = DateFormatter()

class DateFormatter: NSDateFormatter {
    
    class var sharedInstance: NSDateFormatter {
        return _DateFormatterSharedInstance
    }
    
    override init() {
        super.init()
        self.setSafeDefaultLocale()
        self.setUtcTimeZone()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setSafeDefaultLocale()
        self.setUtcTimeZone()
    }
    
}
