//
//  Extensions.swift
//  test_sm
//
//  Created by Pavel Antonyuk on 2/10/19.
//  Copyright © 2019 Pavel Antonyuk. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

//MARK: - RootViewController
public let controllerInstantiate = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:)

public func setRootViewController(_ viewController: UIViewController, animated: Bool = true) {
    guard let delegate = UIApplication.shared.delegate as? AppDelegate, let window = delegate.window else { return }
    window.rootViewController = viewController
    if animated {
        UIView.transition(with: window, duration: 0.25, options: .transitionCrossDissolve, animations: {
            window.rootViewController = viewController
        }, completion: nil)
        return
    }
}

//MARK: - UIColor
extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1) {
        guard hex.hasPrefix("#") else { fatalError("Missing # in UIColor hex init") }
        let chars = Array(hex)
        self.init(red:   CGFloat(strtoul(String(chars[1...2]),nil,16))/255,
                  green: CGFloat(strtoul(String(chars[3...4]),nil,16))/255,
                  blue:  CGFloat(strtoul(String(chars[5...6]),nil,16))/255,
                  alpha: alpha)
    }
}

//MARK: - Connectivity
protocol Connectivity {
    var isNetworkAvailable: Bool { get }
}

//MARK: - Connectivity
extension NetworkProvider: Connectivity {
    var isNetworkAvailable: Bool {
        guard let manager = NetworkReachabilityManager() else { return false }
        return manager.isReachable
    }
}
