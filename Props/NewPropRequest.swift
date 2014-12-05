//
//  NewPropRequest.swift
//  
//  Copyright (c) 2014 Netguru Sp. z o.o. All rights reserved.
//

import UIKit

public struct NewPropRequest {

    var propser: User
    var receiver: User
    var body: String

    init(propser: User, receiver: User, body: String) {
        self.propser = propser
        self.receiver = receiver
        self.body = body
    }

}
