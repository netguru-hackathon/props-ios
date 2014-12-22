//
//  UsersTableViewController.swift
//
//  Copyright (c) 2014 Netguru Sp. z o.o. All rights reserved.
//

import UIKit
import Alamofire

class UsersTableViewController: UITableViewController {

    var users: [User] = []
    var selectedUsers: [User] = []

    var delegate: UsersTableViewControllerDelegate? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = nil;
        self.navigationItem.rightBarButtonItem!.enabled = false
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        Alamofire.request(.GET, "http://shielded-sea-7211.herokuapp.com/api/users.json", parameters: nil)
          .responseJSON { (_, _, json, error) -> Void in
            if let json = json as? [[String: AnyObject]] {
                self.users = json.map {
                    return User(dictionary: $0)
                }
                self.refreshControl!.endRefreshing()
                self.tableView.reloadData()
            }
        }
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("UserCell", forIndexPath: indexPath) as UserTableViewCell

        let user = self.users[indexPath.row]
        cell.nameLabel.text = user.displayName
        cell.avatarView.imageURL = user.avatarURL

        return cell
    }

    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedUsers.removeObject(self.users[indexPath.row])
        if self.selectedUsers.count == 0 {
            self.navigationItem.rightBarButtonItem!.enabled = false
        }
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedUsers.append(self.users[indexPath.row])
        self.navigationItem.rightBarButtonItem!.enabled = true
    }

    @IBAction func doneBarButtonTapped(sender: UIBarButtonItem) {
        self.delegate?.usersTableViewControllerDidFinishWithUsers(self.selectedUsers)
    }

}

extension Array {
    mutating func removeObject<U: Equatable>(object: U) {
        var index: Int?
        for (idx, objectToCompare) in enumerate(self) {
            if let to = objectToCompare as? U {
                if object == to {
                    index = idx
                }
            }
        }
        if(index != nil) {
            self.removeAtIndex(index!)
        }
    }
}

protocol UsersTableViewControllerDelegate {

    func usersTableViewControllerDidFinishWithUsers(users: [User])

}
