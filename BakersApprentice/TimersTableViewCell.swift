//
//  TimersTableViewCell.swift
//  BakersApprentice
//
//  Created by nicole ruduss on 15/05/2016.
//  Copyright © 2016 Bookatable. All rights reserved.
//

import UIKit

protocol TimersTableViewCellModelProtocol {
    var timerSettings: TimerSettings { get set }
}

protocol TimersTableViewCellDelegate {
    
}

class TimersTableViewCellModel: NSObject, TimersTableViewCellModelProtocol {
    var timerSettings: TimerSettings
   
    
    init(timerSettings: TimerSettings) {
        self.timerSettings = timerSettings
        super.init()
        
    }
    

}

class TimersTableViewCell:UITableViewCell {
    
    
    @IBOutlet weak var timerNameLabel: UILabel!
    
    @IBOutlet weak var timerStartDateLabel: UILabel!
    
    var cellModel: TimersTableViewCellModelProtocol?
    var delegate: TimersTableViewCellDelegate?
    
    var currentTimer: NSTimer = NSTimer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(cellModel: TimersTableViewCellModelProtocol) {
        self.cellModel = cellModel
        self.timerNameLabel.text = cellModel.timerSettings.name
        self.timerStartDateLabel.text = String(cellModel.timerSettings.timerCounter)
        self.currentTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    func updateTimer() {
        if (self.cellModel != nil) && self.cellModel?.timerSettings.timerCounter > 0 {
            self.cellModel!.timerSettings.timerCounter = self.cellModel!.timerSettings.timerCounter - 1
        }
    }
    
}