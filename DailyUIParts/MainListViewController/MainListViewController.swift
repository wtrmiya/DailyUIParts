//
//  MainListViewController.swift
//  DailyUIParts
//
//  Created by Wataru Miyakoshi on 2022/04/05.
//

import UIKit
final class MainListViewController: UIViewController {
    
    private var tableView:UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MainListViewControllerCell.self, forCellReuseIdentifier: MainListViewControllerCell.reuseIdentifier)
        return tableView
    }()
    
    var viewControllerList:[String:UIViewController]! {
        didSet {
            keysArray = Array(viewControllerList.keys)
        }
    }
    
    private var keysArray:[String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

extension MainListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewControllerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainListViewControllerCell.reuseIdentifier, for: indexPath) as? MainListViewControllerCell
        else {
            return UITableViewCell()
        }
        
        let key = keysArray[indexPath.row]
        cell.configure(title: key)
        
        return cell
    }
}

extension MainListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = tableView.cellForRow(at: indexPath) as? MainListViewControllerCell
        else {
            return
        }
        
        guard let vc = viewControllerList[cell.title]
        else {
            return
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
