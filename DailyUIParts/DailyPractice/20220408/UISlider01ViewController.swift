//
//  UISlider01ViewController.swift
//  DailyUIParts
//
//  Created by Wataru Miyakoshi on 2022/04/08.
//

import Foundation
import UIKit
import SwiftUI
final class UISlider01ViewController:UIViewController {
    private let customizedSlider = CustomizedSlider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(customizedSlider)
        customizedSlider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customizedSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customizedSlider.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            customizedSlider.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}

struct UISlider01ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            UISlider01ViewController()
        }
        .previewDevice("iPhone 13 mini")
    }
}

