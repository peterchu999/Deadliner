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

class Notification:NSObject{
    
    static var notificationCenter:UNUserNotificationCenter = UNUserNotificationCenter.current()
    static var options: UNAuthorizationOptions = [.alert, .sound, .badge]
    
    enum notifIdentifier: String{
        case cmo = "CMO"
        case end = "END"
    }
    
    static func removeBadge() {
        let currentNotif =  UIApplication.shared.applicationIconBadgeNumber
        let badgeCounter = UserDefaults.standard.integer(forKey: "badge") - currentNotif
        UserDefaults.standard.set(
            badgeCounter < 0
                ? 0
                : badgeCounter,
            forKey: "badge")
        UIApplication.shared.applicationIconBadgeNumber = 0
    }
    
    static func requestNotificationAuth() {
        notificationCenter.requestAuthorization(options: self.options) {
            (didAllow, error) in
            if !didAllow{
                print("User Decline")
            }
        }
    }
    
    static func checkNotificationAuth(){
        notificationCenter.getNotificationSettings { (setting) in
            if setting.authorizationStatus != .authorized {
                
            }
        }
        
    }
    
    static func configureNotifAction() {
        let openApps = UNNotificationAction(identifier: "Open", title: "Open In Apps", options: [])
        let deleteAction = UNNotificationAction(identifier: "Delete", title: "Delete", options: [.destructive])
        let category = UNNotificationCategory(identifier: "DeadlinerNotifications", actions: [openApps, deleteAction], intentIdentifiers: [], options: [])
        self.notificationCenter.setNotificationCategories([category])
    }
    
    static private func createNotification(_ activity:Activity, identifier:notifIdentifier ) {
        let content = UNMutableNotificationContent()
        switch identifier {
            case .cmo:
                content.title = "Coming Up"
                content.body = "\(activity.title) is going to start soon"
            case .end:
                content.title = "Deadline"
                content.body = "\(activity.title) is going to due soon"
        }
        content.sound = .default
        let badge = UserDefaults.standard.integer(forKey: "badge") + 1
        content.badge = NSNumber(value: badge)
        content.userInfo["data"] = content.title
        UserDefaults.standard.set(badge, forKey: "badge")
        content.categoryIdentifier = "DeadlinerNotification"
        let timeInterval =
            identifier == .cmo
                ? activity.startDate.timeIntervalSinceNow
                : activity.endDate.timeIntervalSinceNow
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        let request = UNNotificationRequest(
            identifier: "\(identifier.rawValue)\(activity.objectId)",
            content: content,
            trigger: trigger)
        self.notificationCenter.add(request) { (error) in
            if let error = error {
                print("Error \(error.localizedDescription)")
            }
        }
    }
    
    static func addNotification(_ activity:Activity? = nil) {
        var actv:Activity
        //for Development purpose
        if let activity = activity {
            actv = activity
        } else {
            actv = Activity("trying",Date.init(timeIntervalSinceNow: 2),Date.init(timeIntervalSinceNow: 6),1,"Bulhalala")
        }
        //for development purpose
        createNotification(actv, identifier: .cmo)
        createNotification(actv, identifier: .end)
    }
    
    static func editNotification(_ activity:Activity? = nil) {
        addNotification(activity)
    }
    
    static func getCurrentPendingNotif() {
        self.notificationCenter.getPendingNotificationRequests(completionHandler: {res in 
            print(res)
            })
    }
    
    static func removeNotification(_ activity:Activity? = nil) {
        let actv:Activity
        if let activity = activity {
            actv = activity
        } else {
            actv = Activity("trying",Date.init(timeIntervalSinceNow: 2),Date.init(timeIntervalSinceNow: 6),1,"Bulhalala")
        }
        self.notificationCenter.removePendingNotificationRequests(withIdentifiers: ["CMO\(actv.objectId)","END\(actv.objectId)"])
    }
    
}

extension UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                    willPresent notification: UNNotification,
                                    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
            
            completionHandler([.alert, .sound])
        }
        
        func userNotificationCenter(_ center: UNUserNotificationCenter,
                                    didReceive response: UNNotificationResponse,
                                    withCompletionHandler completionHandler: @escaping () -> Void) {
    //        switch response.actionIdentifier {
    //            case "Open":
    //                print("Open")
    //            case "Delete":
    //                print("Delte")
    //            default:
    //                print("Not Both")
    //        }
            completionHandler()
        }
}

//code below is for development, please remove after production

class Activity {
    var title:String
    var startDate:Date
    var endDate:Date
    var isDone:Bool
    var priority:Int
    var notes:String
    var objectId:String
    
    init(_ title:String,_ startDate:Date,_ endDate:Date, _ priority:Int, _ notes:String) {
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
        self.isDone = false
        self.priority = priority
        self.notes = "Example"
        self.objectId = "id"
    }
}
