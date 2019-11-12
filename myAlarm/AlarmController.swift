//
//  AlarmController.swift
//  myAlarm
//
//  Created by Anthony Torres on 11/11/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

import Foundation

class AlarmController {
    
    static let sharedInstance = AlarmController()
    
    var myAlarm: [Alarm] = []
    
    
    var mockAlarms:[Alarm] {
        return [ Alarm(fireDate: Date(), name: "Today", enabled: true),
                 Alarm(fireDate: Date(), name: "Tomorrow", enabled: true),
                 Alarm(fireDate: Date(), name: "Tuesday", enabled: true)]
    }

    init() {
        self.myAlarm = self.mockAlarms
    }
    
    func toggleEnabled(for alarm: Alarm) {
        alarm.enabled = alarm.enabled ? false : true
    }
    
    func addAlarm(fireDate: Date, name: String, enabled: Bool) {
        let newAlarm = Alarm(fireDate: fireDate, name: name, enabled: true)
        myAlarm.append(newAlarm)
        
        
    }
    
    func updateAlarm(alarm: Alarm, fireDate: Date, name: String, enabled: Bool){
        alarm.enabled = enabled
        alarm.fireDate = fireDate
        alarm.name = name
    }
    
    func delete(alarm: Alarm) {
        guard let index = myAlarm.firstIndex(of: alarm) else { return }
        myAlarm.remove(at: index)
            
    }
    
    
    
    
    
    
    
    
} //End of class
