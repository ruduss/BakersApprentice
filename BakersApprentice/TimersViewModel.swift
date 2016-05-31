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
        let timer = Timer(name: "Bob", start: NSDate(), end: NSDate().addMinutes(40))
        let t = TimersTableViewCellModel(timer: timer)
        timers.append(t)
        let timer2 = Timer(name: "Bobette", start: NSDate().addDays(1), end: NSDate().addDays(1).addMinutes(40))
        let t2 = TimersTableViewCellModel(timer: timer2)
        timers.append(t2)
    }
    
    func add(timer: Timer) {
        timers.append(TimersTableViewCellModel(timer: timer))
    }
    
}

extension TimersViewModel: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let adjustment = tableView.editing ? 1 : 0
        return timers.count + adjustment
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TimerCell", forIndexPath: indexPath) as! TimersTableViewCell
        let currentTimer = timers[indexPath.row]
        
        if indexPath.row >= timers.count && tableView.editing {
            let newTimer =  Timer(name: "NewBob", start: NSDate(), end: NSDate().addMinutes(40))
            cell.configure(TimersTableViewCellModel(timer: newTimer))
        } else {
            let df: DateFormatter = DateFormatter()
            df.setMyDateFormat("HH:mm:ss")
            cell.configure(currentTimer)
        }
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, indentationLevelForRowAtIndexPath indexPath: NSIndexPath) -> Int {
        return timers.count
    }
    
}

extension TimersViewModel: UITableViewDelegate {

    
}