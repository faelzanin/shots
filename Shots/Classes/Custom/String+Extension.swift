//
//  String+Extension.swift
//  Shots
//
//  Created by Rafael Zanin on 29/08/17.
//  Copyright © 2017 Rafael Zanin. All rights reserved.
//

import UIKit

extension String {
  
    var htmlToAttributedString: NSAttributedString {
        var attrStr = NSAttributedString()
        do {
            attrStr = try NSAttributedString(
                data: self.data(using: String.Encoding.unicode, allowLossyConversion: true)!,
                options: [ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
                documentAttributes: nil)
        } catch _ {
            attrStr = NSAttributedString()
        }
        return attrStr
    }
}
