//
//  TimersViewModel.swift
//  BakersApprentice
//
//  Created by nicole ruduss on 03/04/2016.
//  Copyright © 2016 Bookatable. All rights reserved.
//

import UIKit

class TimersViewModel : NSObject {
    
    var timers: [Timer] = []
    
    override init() {
        super.init()
    }
    
    func add() {
        let timer = Timer()
        timers.append(timer)
    }
    
}

extension TimersViewModel: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timers.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let currentTimer = timers[indexPath.row]
        let df: DateFormatter = DateFormatter()
        df.setMyDateFormat("HH:mm:ss")
        cell.textLabel!.text = currentTimer.start.toUtcString()
        return cell
    }
}

extension TimersViewModel: UITableViewDelegate {


}