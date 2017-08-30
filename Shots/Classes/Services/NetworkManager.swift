//
//  NetworkManager.swift
//  Shots
//
//  Created by Rafael Zanin on 29/08/17.
//  Copyright © 2017 Rafael Zanin. All rights reserved.
//

import UIKit
import Alamofire

class NetworkManager {
    static let sharedInstance = NetworkManager()
    
    let manager: Alamofire.SessionManager = {
   
        // Criando custom manager
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        let manager = Alamofire.SessionManager(
            configuration: URLSessionConfiguration.default
        )
        
        return manager
    }()
}

