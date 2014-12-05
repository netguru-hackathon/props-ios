//
//  PropsViewController.swift
//  
//  Copyright (c) 2014 Netguru Sp. z o.o. All rights reserved.
//

import UIKit
import Alamofire

@objc class PropsViewController: UITableViewController {

    var props: [Prop] = []

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.refreshControl!.beginRefreshing()
        self.refreshControlValueChanged(self.refreshControl!)
    }

    @IBAction func refreshControlValueChanged(sender: UIRefreshControl) {
        Alamofire.request(.GET, "http://shielded-sea-7211.herokuapp.com/api/props.json", parameters: nil)
          .responseJSON { (_, _, json, error) -> Void in
            if let json = json as? [[String: AnyObject]] {
                self.props = json.map {
                    return Prop(dictionary: $0)
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
        return self.props.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PropCell", forIndexPath: indexPath) as PropTableViewCell
        let prop = self.props[indexPath.row]

        cell.headlineLabel.text = "\(prop.propser.displayName) -> \(prop.receiver.displayName)"
        cell.bodyLabel.text = prop.body
        cell.avatarView.imageURL = prop.propser.avatarURL

        return cell
    }

}
