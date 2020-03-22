//
//  TimeAndDateUtils.swift
//  Yolo
//
//  Created by Nitin Khurana on 22/03/20.
//  Copyright © 2020 Nitin Khurana. All rights reserved.
//

import Foundation

class TimeAndDateUtils {
    
    static func convertDate(date: Date, to: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = to
        
        return dateFormatter.string(from: date)
    }
    
    static func today() -> Date {
        return Date()
    }
    
    static func tomorrow() -> Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: today()) ?? Date()
    }
}


