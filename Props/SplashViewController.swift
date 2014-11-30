//
//  SplashViewController.swift
//  Props
//
//  Created by Adrian Kashivskyy on 30.11.2014.
//  Copyright (c) 2014 Netguru Sp. z o.o. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    /// A label displaying the app version.
    @IBOutlet private weak var appVersionLabel: UILabel!

    /// The app version string and bundle version.
    private var appVersion: (String, String) {
        var result: (String, String) = ("0.0.0", "0")
        if let info = NSBundle.mainBundle().infoDictionary {
            if let stringVersion = info["CFBundleShortVersionString"] as? String {
                result.0 = stringVersion
            }
            if let bundleVersion = info["CFBundleVersion"] as? String {
                result.1 = bundleVersion
            }
        }
        return result
    }

    override func viewDidLoad() {

        super.viewDidLoad()

        let version = self.appVersion
        self.appVersionLabel.text = "Version \(version.0) (\(version.1))"

    }
    
}
