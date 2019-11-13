//
//  Alarm.swift
//  myAlarm
//
//  Created by Anthony Torres on 11/11/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

import Foundation

class Alarm: Codable {
    
    var fireDate: Date
    var name: String
    var enabled: Bool
    var uuid: String
    
    var fireTimeAsString: String {
        //This Will Give us the Data but as a String from fireDate
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: fireDate)
    }
    
    init(fireDate: Date, name: String, enabled: Bool, uuid: String = UUID().uuidString) {
        self.fireDate = fireDate
        self.name = name
        self.enabled = enabled
        self.uuid = uuid
    }
}

extension Alarm: Equatable {
    static func == (lhs: Alarm, rhs: Alarm) -> Bool {
        return (lhs.fireDate == rhs.fireDate)
    }

}
