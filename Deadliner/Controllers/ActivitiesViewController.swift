////
////  ActivitiesViewController.swift
////  Deadliner
////
////  Created by Muhammad Nobel Shidqi on 08/04/20.
////  Copyright © 2020 Muhammad Nobel Shidqi. All rights reserved.
////
//
//import UIKit
//
//class ActivitiesViewController: UIViewController {
//
//    var db = DBManager()
//    let userDefault = UserDefaults.standard
//    var selectedCategory: Category!
//    
//    var activities: [Activity] = []
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setInterfaceStyle()
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        addNewActivity()
//    }
//    
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        showActivities()
//    }
//
//    func setInterfaceStyle() {
//        overrideUserInterfaceStyle = userDefault.bool(forKey: "darkMode") ? .dark : .light
//    }
//    
//    // MARK: - Only for testing purpose
//    func addNewActivity() {
//        let newActivity = Activity(context: db.context)
//        newActivity.title = "Testing Activity"
//        newActivity.category = selectedCategory 
//        newActivity.startDate = Date()
//        newActivity.endDate = Date()
//        newActivity.priority = 0 // 0 = LOW, 1 = MED, 3 = HIGH
//        newActivity.notes = "Testing Purpose"
//        db.save()
//    }
//
//    func showActivities() {
//        let predicate = NSPredicate(format: "category == %@", selectedCategory)
//        if let results = db.fetchData(for: .activity, withPredicate: predicate) as? [Activity] {
//            for result in results {
//                print("success add new activity")
//                print("Activity : ",result.title!)
//                print("From Category :", result.category!.title!)
//            }
//        }
//    }
//
//}
