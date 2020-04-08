//
//  AddActivityViewController.swift
//  Deadliner
//
//  Created by danny santoso on 07/04/20.
//  Copyright © 2020 Peter Andrew. All rights reserved.
//

import UIKit

//Modal untuk menambahkan aktivitas ke dalam Core Data

class AddActivityViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
    
    @IBOutlet weak var tfActivityName: UITextField!
    @IBOutlet weak var tfStartDate: UITextField!
    @IBOutlet weak var tfPriority: UITextField!
    @IBOutlet weak var tvActivityDescription: UITextView!
    
    let datePicker = UIDatePicker()
    let pickerView = UIPickerView()
    
    @IBOutlet weak var tfDeadlineDate: UITextField!
    
    var pickerData: [String] = [String]()
    
    var result = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tfActivityName.textAlignment = .right
//        tfStartDate.textAlignment = .right
        
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
        
        pickerData = ["High","Medium","Low"]

        //Membuat Garis Bawah pada textfieldnya
        let tfBottomLine_activity = CALayer()
        tfBottomLine_activity.frame = CGRect(x: 0, y: tfActivityName.frame.height - 2, width: tfActivityName.frame.width, height: 2)
        tfBottomLine_activity.backgroundColor = hexStringToUIColor(hex: "000000").cgColor
        
        tfActivityName.borderStyle = .none
        tfActivityName.layer.addSublayer(tfBottomLine_activity)
        
        //Start Date Textfield
        let tfBottomLine_startDate = CALayer()
        tfBottomLine_startDate.frame = CGRect(x: 0, y: tfStartDate.frame.height - 2, width: tfStartDate.frame.width, height: 2)
        tfBottomLine_startDate.backgroundColor = hexStringToUIColor(hex: "000000").cgColor
        
        tfStartDate.borderStyle = .none
        tfStartDate.layer.addSublayer(tfBottomLine_startDate)
        
        //Deadline Date Textfield
        let tfBottomLine_deadlineDate = CALayer()
        tfBottomLine_deadlineDate.frame = CGRect(x: 0, y: tfDeadlineDate.frame.height - 2, width: tfDeadlineDate.frame.width, height: 2)
        tfBottomLine_deadlineDate.backgroundColor = hexStringToUIColor(hex: "000000").cgColor
        
        tfDeadlineDate.borderStyle = .none
        tfDeadlineDate.layer.addSublayer(tfBottomLine_deadlineDate)
        
        //Priority Activity Textfield
        let tfBottomLine_priority = CALayer()
        tfBottomLine_priority.frame = CGRect(x: 0, y: tfPriority.frame.height - 2, width: tfPriority.frame.width, height: 2)
        tfBottomLine_priority.backgroundColor = hexStringToUIColor(hex: "000000").cgColor
        
        tfPriority.borderStyle = .none
        tfPriority.layer.addSublayer(tfBottomLine_priority)
        
        
        
        createDatePicker()
        createDatePickerForDeadline()
        createPriority()
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        result = pickerData[row]
        tfPriority.text = "\(result)"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func createDatePicker(){
        
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //bar button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        //assign toolbar
        tfStartDate.inputAccessoryView = toolbar
        
        tfStartDate.inputView = datePicker
        
        
        
        //date picker mode
        //datePicker.datePickerMode = .date
        
    }
    
    func createDatePickerForDeadline(){
        
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //bar button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedForDeadline))
        toolbar.setItems([doneBtn], animated: true)
        
        //assign toolbar

        
        tfDeadlineDate.inputAccessoryView = toolbar
        tfDeadlineDate.inputView = datePicker
        
        
        //date picker mode
        //datePicker.datePickerMode = .date
        
    }
    
    @objc func donePressed(){
        let formater = DateFormatter()
        formater.dateFormat = "dd.MM.yyyy hh.mm.ss aa"
        let result = formater.string(from: datePicker.date)
        tfStartDate.text = "\(result)"
        self.view.endEditing(true)
    }
    
    @objc func donePressedForDeadline(){
        let formater = DateFormatter()
        formater.dateFormat = "dd.MM.yyyy hh.mm.ss aa"
        let result = formater.string(from: datePicker.date)
        tfDeadlineDate.text = "\(result)"
        self.view.endEditing(true)
    }
    
    func createPriority(){
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //bar button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedPriority))
        
        toolbar.setItems([doneBtn], animated: true)
        
        tfPriority.inputAccessoryView = toolbar
        tfPriority.inputView = pickerView
    }
    
    @objc func donePressedPriority(){
        
        tfPriority.text = "\(result)"
        self.view.endEditing(true)
        
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

}
