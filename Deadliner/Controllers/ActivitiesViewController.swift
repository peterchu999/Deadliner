//
//  ActivitiesViewController.swift
//  Deadliner
//
//  Created by Muhammad Nobel Shidqi on 08/04/20.
//  Copyright © 2020 Muhammad Nobel Shidqi. All rights reserved.
//

import UIKit

class ActivitiesViewController: UIViewController {

    let userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInterfaceStyle()
    }
    

    func setInterfaceStyle() {
        overrideUserInterfaceStyle = userDefault.bool(forKey: "darkMode") ? .dark : .light
    }


}
