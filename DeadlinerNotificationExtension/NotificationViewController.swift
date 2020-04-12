//
//  NotificationViewController.swift
//  DeadlinerNotificationExtension
//
//  Created by Peter Andrew on 10/04/20.
//  Copyright © 2020 Peter Andrew. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
        let activity = notification.request.content.userInfo["data"] as! String
        self.label?.text = activity
    }

}

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
