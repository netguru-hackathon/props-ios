//
//  AvatarView.swift
//  
//  Copyright (c) 2014 Netguru Sp. z o.o. All rights reserved.
//

import UIKit
import Alamofire

class AvatarView: UIView {

    var imageView: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.imageView = UIImageView(frame: CGRectMake(0, 0, 40, 40))
        self.addSubview(self.imageView)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.imageView = UIImageView(frame: CGRectMake(0, 0, 40, 40))
        self.addSubview(self.imageView)
    }

    var imageURL: NSURL! {
        didSet {
            let str = imageURL.absoluteString!
            Alamofire.request(.GET, str, parameters: nil).response { (_, _, data, _) -> Void in
                self.imageView.image = UIImage(data: (data as NSData))!
            }
        }
    }

}
