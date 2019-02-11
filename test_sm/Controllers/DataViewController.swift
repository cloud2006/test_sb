//
//  EventsViewController.swift
//  test_sm
//
//  Created by Pavel Antonyuk on 2/10/19.
//  Copyright © 2019 Pavel Antonyuk. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    private var events = [Data]()
    private var shops = [Data]()
    private var segmentState = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 98
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView(frame: .zero)
        
        DispatchQueue.global().sync { [weak self] in
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
            self?.separateData(array)
        })
    }
    
    private func separateData(_ arr: [Data]) {
        events = arr.filter { $0.type == .event }
        shops = arr.filter { $0.type == .shop }
        
        tableView.reloadData()
    }
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        segmentState = sender.selectedSegmentIndex
        tableView.reloadData()
    }
}

extension DataViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRows = (segmentState == 0) ? self.events.count : self.shops.count
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DataCell.self), for: indexPath) as? DataCell else { fatalError() }
        segmentState == 0 ? (cell.dataItem = events[indexPath.row]) : (cell.dataItem = shops[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = controllerInstantiate("SingleItemViewController") as? SingleItemViewController else { fatalError() }
        segmentState == 0 ? (vc.item = events[indexPath.row]) : (vc.item = shops[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension DataViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
}
