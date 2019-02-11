//
//  Data.swift
//  test_sm
//
//  Created by Pavel Antonyuk on 2/11/19.
//  Copyright © 2019 Pavel Antonyuk. All rights reserved.
//

import Foundation

enum DataType: String, Codable {
    case event = "event"
    case shop = "shop"
}

final class Data: Codable {
    var id: Int
    var type: String
    var title: String
    var shortDescription: String
    var description: String
    var smallImage: String
    var bigImage: String
    var latitude: String
    var longitude: String
}
