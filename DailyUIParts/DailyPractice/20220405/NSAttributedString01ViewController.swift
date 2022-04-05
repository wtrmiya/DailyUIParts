//
//  Practice20220405ViewController.swift
//  DailyUIParts
//
//  Created by Wataru Miyakoshi on 2022/04/05.
//

import Foundation
import UIKit
import SwiftUI
final class NSAttributedString01ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        let myLabel = UILabel()
        myLabel.textColor = UIColor.black
        
        view.addSubview(myLabel)
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            myLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        let text = "ジョバンニはまるで鉄砲丸のように立ちあがりました。そして誰にも聞えないように窓の外へからだを乗り出して力いっぱいはげしく胸をうって叫びそれからもう咽喉のどいっぱい泣きだしました。もうそこらが一ぺんにまっくらになったように思いました。"
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = ceil(myLabel.font.lineHeight)
        paragraphStyle.maximumLineHeight = ceil(myLabel.font.lineHeight)
        paragraphStyle.lineSpacing = ceil(myLabel.font.pointSize)
        
        let attributes = [
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
        ]
        
        let attributedText = NSAttributedString(string: text, attributes: attributes as [NSAttributedString.Key : Any])
        myLabel.attributedText = attributedText
        myLabel.numberOfLines = 0
        myLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        
    }
}

struct NSAttributedString01ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            NSAttributedString01ViewController()
        }
        .previewDevice("iPhone 13 mini")
    }
}

