//
//  MainListViewControllerCell.swift
//  DailyUIParts
//
//  Created by Wataru Miyakoshi on 2022/04/05.
//

import UIKit
final class MainListViewControllerCell:UITableViewCell {
    static let reuseIdentifier = String(describing: MainListViewControllerCell.self)
    private(set) var title:String! {
        didSet {
            titleLabel.text = title
        }
    }
    
    private var titleLabel:UILabel = {
        let label = UILabel()
        label.text = "init"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(title: String) {
        self.title = title
    }
}
