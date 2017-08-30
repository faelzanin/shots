//
//  ShotsService.swift
//  Shots
//
//  Created by Rafael Zanin on 29/08/17.
//  Copyright © 2017 Rafael Zanin. All rights reserved.
//

import UIKit
import Alamofire

class ShotsService: BaseService {
    
    
    class var sharedInstance:ShotsService {
        struct Singleton {
            static let instance = ShotsService()
        }
        
        return Singleton.instance
    }
    
    
    
    public func listShots(onCompletion: @escaping (_ result: NSMutableArray?, _ error: NSError?)->() )
    {
        self.setHeaders();
        let limit = 30;
        
        NetworkManager.sharedInstance.manager.request(Constants.Endpoint.PROD + "/shots?per_page=\(limit)", method: HTTPMethod.get, parameters: nil, encoding: JSONEncoding.default, headers: self.headers).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                
                let responseObject =  response.result.value as? NSArray
                if responseObject != nil {
                    print(responseObject as Any)
                 
                    onCompletion(responseObject?.mutableCopy() as? NSMutableArray, nil)
              
                } else {
                    let errorDic =  response.result.value as? NSDictionary
                    let error = NSError(domain: errorDic?["message"] as! String, code: 400, userInfo: nil)
                    onCompletion(nil, error)
                }
                
                break
            case .failure(_):
                let responseError = response.result.error as NSError?
                let error = NSError(domain: (responseError?.domain)!, code: (responseError?.code)!, userInfo: responseError?.userInfo)
                onCompletion(nil, error)
                break
            }
        }

    
    }
    
    
    public func getShot(shotId : String, onCompletion: @escaping (_ result: NSDictionary?, _ error: NSError?)->() )
    {
        self.setHeaders();
        
        NetworkManager.sharedInstance.manager.request(Constants.Endpoint.PROD + "/shots/"+shotId, method: HTTPMethod.get, parameters: nil, encoding: JSONEncoding.default, headers: self.headers).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                
                let responseObject =  response.result.value as? NSDictionary
                if responseObject != nil && responseObject?.object(forKey: "message") == nil {
                    print(responseObject as Any)
                    
                    onCompletion(responseObject, nil)
                    
                } else {
                    let errorDic =  response.result.value as? NSDictionary
                    let error = NSError(domain: errorDic?["message"] as! String, code: 400, userInfo: nil)
                    onCompletion(nil, error)
                }
                
                break
            case .failure(_):
                let responseObject =  response.result.value as? NSDictionary
                let responseError = response.result.error as NSError?
                let error = NSError(domain: responseObject?.object(forKey: "message")! as! String, code: (responseError?.code)!, userInfo: responseError?.userInfo)
                onCompletion(nil, error)
                break
            }
        }
        
        
    }
}
