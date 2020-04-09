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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func callscheduler(_ sender: Any) {
        Notification.scheduleNotification(notificationType: "alert", "peter \(iteration)",Double(iteration))
        Notification.scheduleNotification(notificationType: "GG", "second \(iteration+10)",Double(iteration+10))
    }
    
    
}

