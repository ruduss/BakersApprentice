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
    
    let timersViewModel = TimersViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblTimers.dataSource = timersViewModel
        tblTimers.delegate = timersViewModel
        navigationItem.rightBarButtonItem = editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            timersViewModel.timers.removeAtIndex(indexPath.row)
            tblTimers.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        else if editingStyle == .Insert {
            let newTimer = Timer(name: "", start: NSDate(), end: NSDate().addMinutes(40))
            timersViewModel.timers.append(TimersTableViewCellModel(timer: newTimer))
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if editing {
            //tblTimers.beginUpdates()
            let indexPath = NSIndexPath(forRow: timersViewModel.timers.count, inSection: 0)
            let newTimer = Timer(name: "", start: NSDate(), end: NSDate().addMinutes(40))
            timersViewModel.timers.append(TimersTableViewCellModel(timer: newTimer))
            //tblTimers.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            //tblTimers.endUpdates()
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
        self.tableView.reloadRowsAtIndexPaths([destinationIndexPath], withRowAnimation: .Automatic)
    }
    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        
        if indexPath.row >= timersViewModel.timers.count {
            return .Insert
        } else {
            return .Delete
        }
    }
    
}

