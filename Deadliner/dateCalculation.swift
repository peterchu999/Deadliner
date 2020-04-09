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
    let startDate = stringtoDateFormatter(dateToBeFormatted: start)
    let endDate = stringtoDateFormatter(dateToBeFormatted: end)
    return dateCalculation(start: startDate, end: endDate)
}

//Calculate when only start is in String format
func calculateDate(start: String, end: Date) -> String{
    let startDate = stringtoDateFormatter(dateToBeFormatted: start)
    return dateCalculation(start: startDate, end: end)
}

func calculateDate(start: Date, end: String) -> String{
    let endDate = stringtoDateFormatter(dateToBeFormatted: end)
    return dateCalculation(start: start, end: endDate)
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

//Formatting string to date
func stringtoDateFormatter(dateToBeFormatted: String) -> Date{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM d, yyyy h:mm a"
    return dateFormatter.date(from: dateToBeFormatted)!
}
