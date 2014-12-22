//
//  GiveTableViewController.swift
//  
//  Copyright (c) 2014 Netguru Sp. z o.o. All rights reserved.
//

import UIKit
import Alamofire

class GiveTableViewController: UITableViewController, UsersTableViewControllerDelegate, UITextViewDelegate {

    var receiver: User?

    @IBOutlet weak var reveiversLabel: UILabel!
    @IBOutlet weak var bodyTextView: UITextView!

    @IBAction func giveButtonTapped(sender: AnyObject) {
        let params: [String: AnyObject] = [
            "propser_id": "3",
            "prop": [
                "user_id": "\(self.receiver!.identifier)",
                "body": self.bodyTextView.text,
            ],
        ]
        Alamofire.request(.POST, "http://shielded-sea-7211.herokuapp.com/api/props.json", parameters: params, encoding: .JSON)
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            if identifier == "ShowUsers" {
                if let vc = segue.destinationViewController as? UsersTableViewController {
                    vc.delegate = self
                }
            }
        }
    }

    func usersTableViewControllerDidFinishWithUsers(users: [User]) {
        self.receiver = users[0]
        self.reveiversLabel.text = self.receiver!.displayName
        self.navigationController!.popViewControllerAnimated(true)
    }

}
