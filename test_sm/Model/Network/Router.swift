//
//  Router.swift
//  test_sm
//
//  Created by Pavel Antonyuk on 2/10/19.
//  Copyright © 2019 Pavel Antonyuk. All rights reserved.
//

import UIKit
import Alamofire

let BASE_URL = "http://smartbox.software/tt/TT.json"

enum CustomError {
    case noInternetConnection
    case undefinedError
    case custom(String)
    
    var localizedDescription: String {
        switch self {
        case .noInternetConnection: return NSLocalizedString("Network connection is unavailable. Please check your internet connection.", comment: "Global_Network_Error")
        case .undefinedError: return NSLocalizedString("Something went wrong. Please try again.", comment: "Global_Error")
        case .custom(let error): return error
        }
    }
}

typealias JSON = [String: Any]

let Network = NetworkProvider()

typealias SuccessClosure = ((Any?) -> Void)?
typealias FailureClosure = ((CustomError) -> Void)?

final class NetworkProvider {
    
    func request(_ url: String, success: SuccessClosure = nil, failure: FailureClosure = nil, completion: @escaping ([Event]?) -> Void) {
        
        if isNetworkAvailable == false {
            failure?(.noInternetConnection)
            return
        }
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            guard response.result.isSuccess else {
                print("Error while fetching data")
                completion(nil)
                return
            }
            guard let value = response.result.value as? [JSON] else {
                    print("Malformed data received")
                    completion(nil)
                    return
            }
            
            let events = value.compactMap { json in return Event(json) }
            completion(events)
        }
    }
}
