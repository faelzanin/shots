//
//  Constants.swift
//  Shots
//
//  Created by Rafael Zanin on 29/08/17.
//  Copyright © 2017 Rafael Zanin. All rights reserved.
//

import UIKit

class Constants: NSObject {
    class Endpoint {
        static let PROD = "https://api.dribbble.com/v1"
       
    }
    
    class Header {
        static let contentType =  "application/json";
        static let accept =  "application/json";
        static let authorizationToken = "Bearer 262fc0f5f9a519fc877ca8682ada7c7321b949a255903fa34b074f5bb5e580e6";
    }

}
