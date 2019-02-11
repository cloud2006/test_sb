//
//  EventsViewController.swift
//  test_sm
//
//  Created by Pavel Antonyuk on 2/10/19.
//  Copyright © 2019 Pavel Antonyuk. All rights reserved.
//

import UIKit

class EventsShopsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    private lazy var data = [Data]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 280
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView(frame: .zero)
        
        DispatchQueue.main.async { [weak self] in
            self?.loadData()
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    private func loadData() {
        Network.request(BASE_URL, success: { [weak self] in
            guard let array = $0 as? [Data] else { return }
            self?.data.append(contentsOf: array)
        })
    }
}

extension EventsShopsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension EventsShopsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
}
