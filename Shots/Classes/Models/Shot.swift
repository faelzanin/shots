//
//  Shot.swift
//  Shots
//
//  Created by Rafael Zanin on 29/08/17.
//  Copyright © 2017 Rafael Zanin. All rights reserved.
//

import UIKit

class Shot: NSObject {

    var title : String?
    var id: Int?
    var viewsCount : Int?
    var createdAt : String?
    var imageNormalUrl : String?
    var descript: String?
    var commentsCount : Int?
    
    
    
    override init() {}
    
    func dicToShot(dic : NSDictionary) {
        self.title = dic["title"] as? String
        self.viewsCount = dic["views_count"] as? Int
        self.id = dic["id"] as? Int
        self.createdAt = dic["created_at"] as? String
        
        let images = dic["images"] as? NSDictionary
        self.imageNormalUrl = images?["normal"] as? String
        
        self.descript = dic["description"] as? String
        self.commentsCount = dic["comments_count"] as? Int
    }
}
