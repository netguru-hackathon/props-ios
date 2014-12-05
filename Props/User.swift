//
//  User.swift
//  
//  Copyright (c) 2014 Netguru Sp. z o.o. All rights reserved.
//

import UIKit

public struct User {

    let identifier: Int
    let displayName: String
    let avatarURL: NSURL

    init(dictionary: [String: AnyObject]) {
        self.identifier = (dictionary["id"] as NSNumber!).integerValue
        self.displayName = dictionary["name"] as String!
        self.avatarURL = NSURL(string: (dictionary["avatar_url"] as String!)) as NSURL!
    }

}
