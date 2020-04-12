//
//  ViewController.swift
//  Deadliner
//
//  Created by Peter Andrew on 07/04/20.
//  Copyright © 2020 Peter Andrew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var iteration = 5
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let badge = defaults.integer(forKey: "badge")
        print("this apps have \(badge)")
    }
    
    
    @IBAction func callscheduler(_ sender: Any) {
        Notification.addNotification()
    }
    
    @IBAction func removeSChedukar(_ sender: Any) {
        Notification.removeNotification()
    }
    
    @IBAction func getSchedule(_ sender: Any) {
        Notification.getCurrentPendingNotif()
    }
    
}

