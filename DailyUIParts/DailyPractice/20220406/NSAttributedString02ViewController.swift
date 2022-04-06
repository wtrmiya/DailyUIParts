//
//  NSAttributedString02ViewController.swift
//  DailyUIParts
//
//  Created by Wataru Miyakoshi on 2022/04/06.
//

import Foundation
import UIKit
import SwiftUI
final class NSAttributedString02ViewController:UIViewController {
    
    private let textView:UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.isSelectable = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let label:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(textView)
        textView.delegate = self
        textView.attributedText = test()
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            textView.heightAnchor.constraint(equalToConstant: 44),
            textView.widthAnchor.constraint(equalToConstant: 100),
            textView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        view.addSubview(label)
        label.attributedText = test()
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 100),
            label.heightAnchor.constraint(equalToConstant: 44),
            label.widthAnchor.constraint(equalToConstant: 100),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    private func test() -> NSAttributedString {
        testAttachment()
    }
}

extension NSAttributedString02ViewController: UITextViewDelegate {
    
}

struct NSAttributedString02ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            NSAttributedString02ViewController()
        }
        .previewDevice("iPhone 13 mini")
    }
}

