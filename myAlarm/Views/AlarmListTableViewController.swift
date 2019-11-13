//
//  AlarmListTableViewController.swift
//  myAlarm
//
//  Created by Anthony Torres on 11/11/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

import UIKit

class AlarmListTableViewController: UITableViewController {
    
    
    let alarmController = AlarmController.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    func switchCellSwitchValueChanged(cell: SwitchTableViewCell) {
        if let alarm = cell.alarm {
            
            alarmController.toggleEnabled(for: alarm)
            tableView.reloadData()
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarmController.myAlarm.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "switchCell", for: indexPath) as? SwitchTableViewCell
        let alarm = alarmController.myAlarm[indexPath.row]
        
        cell?.alarm = alarm
        cell?.delegate = self
        
        return cell ?? UITableViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailViewCell" {
            if let index = tableView.indexPathForSelectedRow {
                if let destinationVC = segue.destination as? AlarmDetailTableViewController {
                    let alarm = alarmController.myAlarm[index.row]
                    destinationVC.alarm = alarm
                }
            }
        }
    }
}

extension AlarmListTableViewController: SwitchTableViewCellDelegate {
    
    func alarmSwitchTapped(for cell: SwitchTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let alarm = AlarmController.sharedInstance.myAlarm[indexPath.row]
        AlarmController.sharedInstance.toggleEnabled(for: alarm)
        cell.updateView(with: alarm)
    }
}
