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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

