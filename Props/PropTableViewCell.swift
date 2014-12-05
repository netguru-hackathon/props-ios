//
//  PropTableViewCell.swift
//  
//  Copyright (c) 2014 Netguru Sp. z o.o. All rights reserved.
//

import UIKit

class PropTableViewCell: UITableViewCell {

    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var avatarView: AvatarView!

    override func prepareForReuse() {
        super.prepareForReuse()
        self.avatarView.imageView.image = nil
    }

}
