//
//  AlarmDetailTableViewController.swift
//  myAlarm
//
//  Created by Anthony Torres on 11/11/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

import UIKit

class AlarmDetailTableViewController: UITableViewController {

    let alarmController = AlarmController.sharedInstance
    var alarm: Alarm?
    
    @IBOutlet weak var alarmTimePicker: UIDatePicker!
    
    @IBOutlet weak var alarmNameText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func enableButtonTapped(_ sender: Any) {
    }
    @IBAction func saveButtonTapped(_ sender: Any) {
        if let alarm = alarm {
            alarmController.updateAlarm(alarm: alarm, fireDate: alarmTimePicker?.date ?? Date(), name: alarmNameText?.text ?? "", enabled: true)
        } else {
            alarmController.addAlarm(fireDate: alarmTimePicker.date, name: alarmNameText.text ?? "", enabled: true)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Table view data source

    /*
     
     override func numberOfSections(in tableView: UITableView) -> Int {
     // #warning Incomplete implementation, return the number of sections
     return 1
     }
     
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     // #warning Incomplete implementation, return the number of rows
     return alarmController.myAlarm.count
     }
     
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "switchCell", for: indexPath) as? SwitchTableViewCell
     let alarm = alarmController.myAlarm[indexPath.row]
     cell?.alarm = alarm
     
     return cell ?? UITableViewCell()
     }
     */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
