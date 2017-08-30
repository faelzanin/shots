//
//  DateUtil.swift
//  Shots
//
//  Created by Rafael Zanin on 29/08/17.
//  Copyright © 2017 Rafael Zanin. All rights reserved.
//

import UIKit

class DateUtil: NSObject {
    
    class var sharedInstance:DateUtil {
        struct Singleton {
            static let instance = DateUtil()
        }
        
        return Singleton.instance
    }
    
    func formatDate(string : String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: string)!
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    

}
