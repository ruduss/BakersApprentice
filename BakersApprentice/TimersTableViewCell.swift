//
//  TimersTableViewCell.swift
//  BakersApprentice
//
//  Created by nicole ruduss on 15/05/2016.
//  Copyright © 2016 Bookatable. All rights reserved.
//

import UIKit

protocol TimersTableViewCellModelProtocol {
    var timer: Timer { get set}
}

protocol TimersTableViewCellDelegate {
    
}

class TimersTableViewCellModel: NSObject, TimersTableViewCellModelProtocol {
    var timer: Timer
    
    init(timer: Timer) {
        self.timer = timer
    }
}

class TimersTableViewCell:UITableViewCell {
    
    
    @IBOutlet weak var timerNameLabel: UILabel!
    
    @IBOutlet weak var timerStartDateLabel: UILabel!
    
    var cellModel: TimersTableViewCellModelProtocol?
    var delegate: TimersTableViewCellDelegate?
    
    var timer: Timer! {
        didSet {
            timerNameLabel.text = timer.name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(cellModel: TimersTableViewCellModelProtocol) {
        self.cellModel = cellModel
        
        self.timerNameLabel.text = cellModel.timer.name
        self.timerStartDateLabel.text = String(cellModel.timer.start)
    }
    
    
}