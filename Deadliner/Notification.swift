//
//  Notification.swift
//  Deadliner
//
//  Created by Peter Andrew on 08/04/20.
//  Copyright © 2020 Peter Andrew. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

class Notification {
    
    static var notificationCenter:UNUserNotificationCenter = UNUserNotificationCenter.current()
    static var options: UNAuthorizationOptions = [.alert, .sound, .badge]
    
    static func requestNotificationAuth() {
        print("called scheduke req")
        notificationCenter.requestAuthorization(options: self.options) {
            (didAllow, error) in
            if !didAllow{
                print("User Decline")
            }
        }
    }
    
    static func checkNotificationAuth(){
        print("called scheduke check")
        notificationCenter.getNotificationSettings { (setting) in
            if setting.authorizationStatus != .authorized {
                
            }
        }
        
    }
    
    
    
    static func scheduleNotification(notificationType:String,_ body:String, _ time:Double) {
        checkNotificationAuth()
        let userActions = "User Actions"
        let content = UNMutableNotificationContent()
        content.title = notificationType
        content.body = body
        content.sound = .default
        content.badge = 1
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
        let identifier = "Local Notification\(body)"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        self.notificationCenter.add(request) { (error) in
            if let error = error {
                print("Error \(error.localizedDescription)")
            }
        }
        let snoozeAction = UNNotificationAction(identifier: "Snooze", title: "Snooze", options: [])
        let deleteAction = UNNotificationAction(identifier: "Delete", title: "Delete", options: [.destructive])
        let category = UNNotificationCategory(identifier: userActions, actions: [snoozeAction, deleteAction], intentIdentifiers: [], options: [])
        
        self.notificationCenter.setNotificationCategories([category])
        print("called scheduke func")
    }
}
