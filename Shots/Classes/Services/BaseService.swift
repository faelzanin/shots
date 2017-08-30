//
//  BaseService.swift
//  Shots
//
//  Created by Rafael Zanin on 29/08/17.
//  Copyright © 2017 Rafael Zanin. All rights reserved.
//

import UIKit
import Alamofire

class BaseService: NSObject {
    var headers: HTTPHeaders?  = nil
    public func setHeaders()
    {
        self.headers  = [
            "Content-Type": Constants.Header.contentType,
            "Accept": Constants.Header.accept,
            "Authorization": Constants.Header.authorizationToken
        ]
    }
    
}
