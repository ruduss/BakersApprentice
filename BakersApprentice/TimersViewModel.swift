//
//  TimersViewModel.swift
//  BakersApprentice
//
//  Created by nicole ruduss on 03/04/2016.
//  Copyright © 2016 Bookatable. All rights reserved.
//

import UIKit

class TimersViewModel : NSObject {
    
    var timers: [TimersTableViewCellModelProtocol] = []
    
    override init() {
        super.init()
        add()
    }
    
    func add() {
        let timer = TimerSettings(name: "Bob", start: NSDate(), end: NSDate().addMinutes(40))
        let t = TimersTableViewCellModel(timerSettings: timer)
        timers.append(t)
        let timer2 = TimerSettings(name: "Bobette", start: NSDate().addDays(1), end: NSDate().addDays(1).addMinutes(40))
        let t2 = TimersTableViewCellModel(timerSettings: timer2)
        timers.append(t2)
    }
    
    func add(timer: TimerSettings) {
        timers.append(TimersTableViewCellModel(timerSettings: timer))
    }
    
}