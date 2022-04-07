//
//  NSAttributedString02ViewController+AttributesExample.swift
//  DailyUIParts
//
//  Created by Wataru Miyakoshi on 2022/04/06.
//

import Foundation
import UIKit
extension NSAttributedString02ViewController {
    func testAttachment() -> NSAttributedString{
        let string = NSMutableAttributedString()
        
        // Attach a logo image
        if let image = UIImage(systemName: "icloud.fill") {
            let attachment = NSTextAttachment()
            attachment.image = image
            attachment.bounds = CGRect(x: 0, y: -5, width: 20, height: 20)
            
            string.append(NSAttributedString(attachment: attachment))
        }
        
        string.append(NSAttributedString(string: "Hello"))
        
        // Attach a file data
        let attachment = NSTextAttachment()
        attachment.contents = "Hello".data(using: .utf8)
        attachment.fileType = "txt"
        attachment.bounds = CGRect(x: 0, y: -5, width: 20, height: 20)
        string.append(NSAttributedString(attachment: attachment))
        
        return string
    }
    
    func testBackGroundColor() -> NSAttributedString {
        let string = NSMutableAttributedString(string: "SALE 30% OFF")
        string.addAttribute(.backgroundColor, value: UIColor.green, range: NSRange(5...7))
        return string
    }
    
    func testBaselineOffset() -> NSAttributedString {
        let string = NSMutableAttributedString(string:"good morning")
        string.addAttribute(.baselineOffset, value: 5, range: NSRange(location: 5, length: 1))
        string.addAttribute(.baselineOffset, value: 4, range: NSRange(location: 6, length: 1))
        string.addAttribute(.baselineOffset, value: 3, range: NSRange(location: 7, length: 1))
        string.addAttribute(.baselineOffset, value: 2, range: NSRange(location: 8, length: 1))
        string.addAttribute(.baselineOffset, value: 1, range: NSRange(location: 9, length: 1))
        string.addAttribute(.baselineOffset, value: 0, range: NSRange(location: 10, length: 1))
        string.addAttribute(.baselineOffset, value: -1, range: NSRange(location: 11, length: 1))
        
        return string
    }
}
