//
//  dateCalculation.swift
//  Deadliner
//
//  Created by Alfon on 09/04/20.
//  Copyright © 2020 Peter Andrew. All rights reserved.
//

import Foundation

//Calculate date using Date parameters
func calculateDate(start: Date, end: Date) -> String{
    return dateCalculation(start: start, end: end)
}


//Calculate date using String parameters
func calculateDate(start: String, end: String) -> String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM d, yyyy h:mm a"
    let startDate = dateFormatter.date(from: start)!
    let endDate = dateFormatter.date(from: end)!
    return dateCalculation(start: startDate, end: endDate)
}


//Calculate function
private func dateCalculation(start: Date, end: Date) -> String{
    let calculateDate = end.timeIntervalSince(start)
    let hour = floor(calculateDate / 60 / 60)
    if (hour < 24){
        let minutes = floor((calculateDate - (hour * 60 * 60)) / 60)
        if(hour < 1){
            return "\(Int(minutes)) Minutes remaining"
        }
        return "\(Int(hour)) Hours \(Int(minutes)) Minutes remaining"
    }
    let days = floor(hour/24)
    return "\(Int(days)) Days remaining"
}
