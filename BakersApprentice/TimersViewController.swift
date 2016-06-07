//
//  SecondViewController.swift
//  BakersApprentice
//
//  Created by nicole ruduss on 03/04/2016.
//  Copyright © 2016 Bookatable. All rights reserved.
//

import UIKit

class TimersViewController: UITableViewController {

    @IBOutlet var tblTimers: UITableView!
    
    @IBOutlet weak var newTimerTextField: UITextField!
    
    @IBOutlet weak var timerName: UITextField!
    
    let timersViewModel = TimersViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblTimers.dataSource = self
        tblTimers.delegate = self
        navigationItem.rightBarButtonItem = editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func AddTimer(sender: AnyObject) {
        if let time = Int(newTimerTextField.text!), let name = timerName.text {
            let timer = TimerSettings(name: name, start: NSDate(), end: NSDate().addMinutes(time))
            timersViewModel.add(timer)
            tblTimers.reloadData()
        }

    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            timersViewModel.timers.removeAtIndex(indexPath.row)
            tblTimers.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        else if editingStyle == .Insert {
            let newTimer = TimerSettings(name: "", start: NSDate(), end: NSDate().addMinutes(40))
            timersViewModel.timers.append(TimersTableViewCellModel(timerSettings: newTimer))
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TimerCell", forIndexPath: indexPath) as! TimersTableViewCell
        let currentTimer = timersViewModel.timers[indexPath.row]
        
        if indexPath.row >= timersViewModel.timers.count && tableView.editing {
            let newTimer =  TimerSettings(name: "NewBob", start: NSDate(), end: NSDate().addMinutes(40))
            cell.configure(TimersTableViewCellModel(timerSettings: newTimer))
        } else {
            let df: DateFormatter = DateFormatter()
            df.setMyDateFormat("HH:mm:ss")
            cell.configure(currentTimer)
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let adjustment = tableView.editing ? 1 : 0
        return timersViewModel.timers.count + adjustment
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, indentationLevelForRowAtIndexPath indexPath: NSIndexPath) -> Int {
        return timersViewModel.timers.count
    }

    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if editing {
            tblTimers.setEditing(true, animated: true)
            
        } else {
            tblTimers.setEditing(false, animated: true)
        }
    
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        if self.editing && indexPath.row < timersViewModel.timers.count {
            return nil
        }
        return indexPath
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if indexPath.row >= timersViewModel.timers.count && editing {
            self.tableView(tableView, commitEditingStyle: .Insert, forRowAtIndexPath: indexPath)
        }
    }
    
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if indexPath.row >= timersViewModel.timers.count && self.editing {
            return false
        }
        return true
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let movedObject = timersViewModel.timers[sourceIndexPath.row]
        timersViewModel.timers.removeAtIndex(sourceIndexPath.row)
        timersViewModel.timers.insert(movedObject, atIndex: destinationIndexPath.row)
    }
    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        
        if indexPath.row >= timersViewModel.timers.count {
            return .Insert
        } else {
            return .Delete
        }
    }
    
}

