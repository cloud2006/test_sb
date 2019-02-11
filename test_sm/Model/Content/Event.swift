//
//  Event.swift
//  test_sm
//
//  Created by Pavel Antonyuk on 2/10/19.
//  Copyright © 2019 Pavel Antonyuk. All rights reserved.
//

import UIKit

enum ItemType {
    case event, shop
}

class Event {
    
    var id: Int
    var type: String
    var title: String
    var shortDescription: String
    var description: String
    var smallImage: String
    var bigImage: String
    var latitude: String
    var longitude: String
    
    init(_ json: JSON) {
        id = json["id"] as? Int ?? 0
        type = json["type"] as? String ?? ""
        title = json["title"] as? String ?? ""
        shortDescription = json["shortDescription"] as? String ?? ""
        description = json["description"] as? String ?? ""
        smallImage = json["smallImage"] as? String ?? ""
        bigImage = json["bigImage"] as? String ?? ""
        latitude = json["latitude"] as? String ?? ""
        longitude = json["longitude"] as? String ?? ""
    }
    
}
