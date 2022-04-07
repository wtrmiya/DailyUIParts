//
//  CustomizedSlider.swift
//  DailyUIParts
//
//  Created by Wataru Miyakoshi on 2022/04/08.
//

import UIKit
final class CustomizedSlider: UISlider {
    var trackHeight: CGFloat = 10
    var thumbRadius: CGFloat = 20
    
    // 大きさに影響のないつまみのデザインをまとめてここで設定しておく。
    private lazy var thumbView: UIView = {
        let thumb = UIView()
        thumb.layer.borderWidth = 1
        thumb.layer.backgroundColor = UIColor.white.cgColor
        
        thumb.layer.shadowOpacity = 1.0
        thumb.layer.shadowRadius = 3
        thumb.layer.shadowOffset = CGSize(width: 0, height: 1)
        thumb.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        return thumb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 最小値 / 最大値の画像を設定
        minimumValueImage = UIImage(systemName: "square.and.arrow.down")
        maximumValueImage = UIImage(systemName: "square.and.arrow.up")
        
        // normal / highlightedのそれぞれで描画するノブを変更する。
        let thumb = thumbImage(diameter: thumbRadius)
        setThumbImage(thumb, for: .normal)
        
        let highlightThumb = thumbImage(diameter: thumbRadius * 1.2)
        setThumbImage(highlightThumb, for: .highlighted)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // 指定した直径でノブを描画する。
    private func thumbImage(diameter: CGFloat) -> UIImage {
        thumbView.frame = CGRect(x: 0, y: 0, width: diameter, height: diameter)
        thumbView.layer.cornerRadius = diameter / 2
        
        // UIGraphicsImageRenderer
//        let renderer = UIGraphicsImageRenderer(bounds: CGRect(x: -(diameter * 0.5 / 2), y: -(diameter * 0.5 / 2), width: diameter * 1.5, height: diameter * 1.5))
        let renderer = UIGraphicsImageRenderer(bounds: CGRect(x: -(diameter * 0.25), y: -(diameter * 0.25), width: diameter * 1.5, height: diameter * 1.5))
        return renderer.image { rendererContext in
            thumbView.layer.render(in: rendererContext.cgContext)
        }
    }
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        print("class: \(String(describing: type(of: self))), function: \(#function)")
        var newRect = super.trackRect(forBounds: bounds)
        newRect.size.height = trackHeight
        return newRect
    }
}
