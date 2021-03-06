//
//  SecondViewController.swift
//  Weibo
//
//  Created by Ant on 3/19/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class MsgViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var buttonCells = [["@我的","at_round_blue"], ["评论","comment_round_green"], ["赞","like_round_orange"], ["订阅消息","dingyue_round_blue"]]
    var msgCells: [Dictionary<String, AnyObject>] = [
        [
            "image" : UIImage(named: "avatar")!,
            "name" : "索思科技协会",
            "msg" : "你终于关注我了！！！！一起学习吧！！！！",
            "date" : "2015-11-23"
        ],
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row < buttonCells.count {
            let cell = tableView.dequeueReusableCellWithIdentifier("ButtonCell") as! ButtonCell
            cell.initCell(buttonCells[indexPath.row][0], image: UIImage(named: buttonCells[indexPath.row][1])!)
            return cell
        } else {
            let index = indexPath.row - buttonCells.count
            let cell = tableView.dequeueReusableCellWithIdentifier("MsgCell") as! MsgCell
            cell.initCell(msgCells[index]["image"] as! UIImage, name: msgCells[index]["name"] as! String, msg: msgCells[index]["msg"] as! String, date: msgCells[index]["date"] as! String)
            return cell
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buttonCells.count + msgCells.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 55
    }

}

