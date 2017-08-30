//
//  ShotsController.swift
//  Shots
//
//  Created by Rafael Zanin on 29/08/17.
//  Copyright © 2017 Rafael Zanin. All rights reserved.
//

import UIKit


@objc protocol ShotsControllerDelegate {
    
    @objc optional func listShotsDidFinishWithSuccess(response : NSMutableArray)
    @objc optional func listShotsDidFinishWithError(error : NSError?)
    
    @objc optional func getShotDidFinishWithSuccess(response : Shot)
    @objc optional func getShotDidFinishWithError(error : NSError?)
}

class ShotsController: NSObject {
    var delegate: ShotsControllerDelegate?
    
    override init(){
        
    }
    
    class var sharedInstance:ShotsController {
        struct Singleton {
            static let instance = ShotsController()
        }
        
        return Singleton.instance
    }
    
    
    func listShots()  {
        ShotsService.sharedInstance.listShots() { (response, error) in
            if(error == nil) {
                let shotsList = NSMutableArray()
                for dic in response as! [NSDictionary] {
                    let shot = Shot()
                    shot.dicToShot(dic: dic)
                    shotsList.add(shot)
                }
                
                self.delegate?.listShotsDidFinishWithSuccess!(response: shotsList)
            } else {
                self.delegate?.listShotsDidFinishWithError!(error: error)
            }
        }
    }
    
    
    func getShot(shotId : Int)  {
        
        let shotIdString = String.init(format: "%d", shotId)
        
        ShotsService.sharedInstance.getShot(shotId: shotIdString) { (response, error) in
            if(error == nil) {
                let shot = Shot()
                shot.dicToShot(dic: response!)
                self.delegate?.getShotDidFinishWithSuccess!(response: shot)
            } else {
                self.delegate?.getShotDidFinishWithError!(error: error)
            }
        }
    }
    
    
   
}
