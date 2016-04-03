//
//  SecondViewController.swift
//  BakersApprentice
//
//  Created by nicole ruduss on 03/04/2016.
//  Copyright © 2016 Bookatable. All rights reserved.
//

import UIKit

class TimersViewController: UIViewController {

    @IBOutlet weak var tblTimers: UITableView!
    
    let timersViewModel = TimersViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblTimers.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tblTimers.dataSource = timersViewModel
        tblTimers.delegate = timersViewModel
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func InsertButtonPressed(sender: AnyObject) {
        timersViewModel.add()
        tblTimers.reloadData()
    }

}

