//
//  Prop.swift
//  
//  Copyright (c) 2014 Netguru Sp. z o.o. All rights reserved.
//

import UIKit

struct Prop: Equatable {

    let identifier: Int
    let body: String
    let date: NSDate
    let numberOfUpvotes: UInt
    let upvotePossible: Bool
    let propser: User
    let receiver: User

    init(dictionary: [String: AnyObject]) {
        self.identifier = (dictionary["id"] as NSNumber!).integerValue
        self.body = dictionary["body"] as String
        self.date = NSDate()
        self.numberOfUpvotes = UInt((dictionary["upvotes_count"] as NSNumber!).integerValue)
        self.upvotePossible = (dictionary["is_upvote_possible"] as NSNumber!).boolValue
        self.propser = User(dictionary: dictionary["propser"] as [String: AnyObject]!)
        self.receiver = User(dictionary: dictionary["user"] as [String: AnyObject]!)
    }

}

func == (lhs: Prop, rhs: Prop) -> Bool {
    return lhs.identifier == rhs.identifier
}
