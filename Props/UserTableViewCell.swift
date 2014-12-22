//
//  UserTableViewCell.swift
//
//  Copyright (c) 2014 Netguru Sp. z o.o. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarView: AvatarView!
    @IBOutlet weak var nameLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        self.avatarView.imageView.image = nil;
    }

}
