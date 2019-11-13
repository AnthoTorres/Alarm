//
//  AlarmController.swift
//  myAlarm
//
//  Created by Anthony Torres on 11/11/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

import UIKit

protocol AlarmScheduler: class {
    func scheduleUserNotifications(for alarm: Alarm)
    func cancelUserNotifications(for alarm: Alarm)
}

extension AlarmScheduler {
    func scheduleUserNotifications(for alarm: Alarm) {
        
        let content = UNMutableNotificationContent()
        content.body = "Its time to get up"
        content.title = "Get up!"
        content.sound = .default()
        let components = Calendar.current.dateComponents([.hour, .minute], from: alarm.fireDate)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
        
        
        let request = UNNotificationRequest(identifier: alarm.uuid, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("Faild to schedule notification")
                print(error, error.localizedDescription)
            } else {
                print("Successfully scheduled notification")
            }
        }
        
    }
    
    
    func cancelUserNotifications(for alarm: Alarm) {
        
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [alarm.uuid])
        
    }
}

class AlarmController: AlarmScheduler {
    
    static let sharedInstance = AlarmController()
    
    var myAlarm: [Alarm] = []
    
    
    var mockAlarms:[Alarm] {
        return [ Alarm(fireDate: Date(), name: "Today", enabled: true),
                 Alarm(fireDate: Date(), name: "Tomorrow", enabled: true),
                 Alarm(fireDate: Date(), name: "Tuesday", enabled: true)]
    }

    init() {
        self.myAlarm = self.mockAlarms
        loadToPersistance()
    }
    
    func toggleEnabled(for alarm: Alarm) {
        alarm.enabled = alarm.enabled ? false : true
        if alarm.enabled {
            scheduleUserNotifications(for: alarm)
        } else {
            cancelUserNotifications(for: alarm)
        }
    }
    
    func addAlarm(fireDate: Date, name: String, enabled: Bool) {
        let newAlarm = Alarm(fireDate: fireDate, name: name, enabled: true)
        myAlarm.append(newAlarm)
        saveToPersistentStore()
        scheduleUserNotifications(for: newAlarm)
    }
    
    func updateAlarm(alarm: Alarm, fireDate: Date, name: String, enabled: Bool){
        alarm.enabled = enabled
        alarm.fireDate = fireDate
        alarm.name = name
        saveToPersistentStore()
        cancelUserNotifications(for: alarm)
        scheduleUserNotifications(for: alarm)
    }
    
    func delete(alarm: Alarm) {
        guard let index = myAlarm.firstIndex(of: alarm) else { return }
        myAlarm.remove(at: index)
        saveToPersistentStore()
            
    }
    
    func fileUrl() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        let fileName = "Alarm.json"
        let url = documentDirectory.appendingPathComponent(fileName)
        
        
        return url
    }
    
    func saveToPersistentStore() {
        let jsonEncoder = JSONEncoder()
        do { let alarmData = try jsonEncoder.encode(myAlarm)
            try alarmData.write(to: fileUrl())
        } catch let error {
            print(error)
        }
        
    }
    
    func loadToPersistance() {
        let jsonDecoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileUrl())
            let decodedEntry = try jsonDecoder.decode([Alarm].self, from: data)
            self.myAlarm = decodedEntry
        } catch let error {
            print(error)
        }
    }
    
//    func toggleIsOn(for alarm: AlarmController) {
//        Alarm.enabled = !Alarm.enabled
//    }
} //End of class
