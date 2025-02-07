//
//  SwitchTableViewCell.swift
//  myAlarm
//
//  Created by Anthony Torres on 11/11/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

import UIKit

protocol SwitchTableViewCellDelegate: class {
    func switchCellSwitchValueChanged(cell: SwitchTableViewCell)
}

class SwitchTableViewCell: UITableViewCell {
    
    weak var delegate: SwitchTableViewCellDelegate?
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    var alarm: Alarm? {
        didSet {
            setUpCell()
        }
    }
    
    func setUpCell() {
        timeLabel?.text = alarm?.fireTimeAsString
        nameLabel?.text = alarm?.name
    }
    
    
    
    @IBAction func switchValueChanged(_ sender: Any) {
        if let delegate = delegate {
            delegate.switchCellSwitchValueChanged(cell: self)
        }
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateView(with alarm: Alarm) {
        
        nameLabel.text = alarm.name
        timeLabel.text = alarm.fireTimeAsString
        
        self.backgroundColor = alarm.enabled ? .cyan : .white
    }

}
