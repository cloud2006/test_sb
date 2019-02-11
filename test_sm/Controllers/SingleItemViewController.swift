//
//  SingleItemViewController.swift
//  test_sm
//
//  Created by Pavel Antonyuk on 2/11/19.
//  Copyright © 2019 Pavel Antonyuk. All rights reserved.
//

import UIKit
import SDWebImage

class SingleItemViewController: UIViewController {
    
    var item: Data?
    
    @IBOutlet weak var bigImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var shortDescLabel: UILabel!
    
    @IBOutlet weak var fullDesc: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let unwrappedItem = item else { return }
        
        bigImageView.sd_setImage(with: URL(string: unwrappedItem.bigImage))
        titleLabel.text = unwrappedItem.title
        shortDescLabel.text = unwrappedItem.shortDescription
        fullDesc.text = unwrappedItem.description
        if unwrappedItem.type == .event {
            self.title = "Event"
        } else {
            self.title = "Shop"
        }
    }
    
    @IBAction func showOnMapPressed(_ sender: UIButton) {
        
        guard let vc = controllerInstantiate("MapViewController") as? MapViewController else { fatalError() }
        vc.item = self.item
        navigationController?.pushViewController(vc, animated: true)
        
    }
    

}
