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
}
