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
    private var pickerViewContents:[String:(() -> NSAttributedString)]!
    private var pickerViewKeyList:[String]!
    
    private let outlineView = UIView()
    
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
    
    private var pickerView:UIPickerView!
    
    private var methodToAssign:(()->NSAttributedString)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        setClosure()
        
        setNSAttributedString()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(outlineView)
        outlineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            outlineView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            outlineView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            outlineView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            outlineView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        outlineView.addSubview(textView)
        textView.delegate = self
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: outlineView.topAnchor, constant: 100),
            textView.heightAnchor.constraint(equalToConstant: 44),
            textView.widthAnchor.constraint(equalToConstant: 100),
            textView.centerXAnchor.constraint(equalTo: outlineView.centerXAnchor),
        ])
        
        outlineView.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 100),
            label.heightAnchor.constraint(equalToConstant: 44),
            label.widthAnchor.constraint(equalToConstant: 100),
            label.centerXAnchor.constraint(equalTo: outlineView.centerXAnchor),
        ])
        
        // picker view
        pickerView = UIPickerView()
        pickerView.backgroundColor = .lightGray
        pickerView.delegate = self
        pickerView.dataSource = self
        view.addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pickerView.heightAnchor.constraint(equalToConstant: 100),
            pickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pickerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
    private func setNSAttributedString() {
        guard let method = methodToAssign else { return }
        textView.attributedText = method()
        label.attributedText = method()
    }
    
    private func setClosure() {
        self.pickerViewContents = [
            "attachment":testAttachment,
            "backgroundColor":testBackGroundColor,
            "baselineOffset":testBaselineOffset,
        ]
        
        self.pickerViewKeyList = Array(pickerViewContents.keys)
    }
}

extension NSAttributedString02ViewController: UITextViewDelegate {
    
}

extension NSAttributedString02ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewKeyList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let key = pickerViewKeyList[row]
        methodToAssign = pickerViewContents[key]
        setNSAttributedString()
        outlineView.setNeedsLayout()
    }
}

extension NSAttributedString02ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewContents.count
    }
}

struct NSAttributedString02ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            NSAttributedString02ViewController()
        }
        .previewDevice("iPhone 13 mini")
    }
}

