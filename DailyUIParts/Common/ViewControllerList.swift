//
//  ViewControllerList.swift
//  DailyUIParts
//
//  Created by Wataru Miyakoshi on 2022/04/05.
//

import Foundation
import UIKit

final class ViewControllerList {
    static let viewControllerList:[String:UIViewController] = [
        String(describing: NSAttributedString01ViewController.self):NSAttributedString01ViewController(),
        String(describing: NSAttributedString02ViewController.self):NSAttributedString02ViewController(),
        String(describing: UISlider01ViewController.self):UISlider01ViewController(),
    ]
}
