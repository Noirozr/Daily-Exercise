//
//  ViewController.swift
//  Stretchy Headers
//
//  Created by Noirozr on 15/10/13.
//  Copyright © 2015年 Yongjia Liu. All rights reserved.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
    
    let items = [
        NewsItem(category: .World, summary: "Climate change protests, divestments meet fossil fuels realities"),
        NewsItem(category: .Europe, summary: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime'"),
        NewsItem(category: .MiddleEast, summary: "Airstrikes boost Islamic State, FBI director warns more hostages possible"),
        NewsItem(category: .Africa, summary: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim"),
        NewsItem(category: .AsiaPacific, summary: "Despite UN ruling, Japan seeks backing for whale hunting"),
        NewsItem(category: .Americas, summary: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria"),
        NewsItem(category: .World, summary: "South Africa in $40 billion deal for Russian nuclear reactors"),
        NewsItem(category: .Europe, summary: "'One million babies' created by EU student exchanges"),
    ]
    
    var headerView: UIImageView!
    private let kTableViewHeight: CGFloat = 300
    private var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView()
        self.view.addSubview(tableView)
        tableView.snp_makeConstraints() { (make) -> Void in
            make.edges.equalTo(self.view)
        }
//        headerView = tableView.tableHeaderView
//        tableView.tableHeaderView = nil
        headerView = UIImageView(frame: CGRectMake(0, 0, self.view.frame.width, 300))
        headerView.image = UIImage(named: "header")
        tableView.tableHeaderView = headerView
        tableView.addSubview(headerView)
        
        tableView.registerClass(TableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self

//        
//        tableView.contentInset = UIEdgeInsets(top: kTableViewHeight, left: 0, bottom: 0, right: 0)
//        tableView.contentOffset = CGPoint(x: 0, y: -kTableViewHeight)
        print(tableView.contentOffset)
        self.tableView = tableView
        
        updateHeaderView()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func updateHeaderView() {
        var headerRect = CGRectMake(0, -kTableViewHeight, self.view.bounds.width, self.view.bounds.height)
        if tableView.contentOffset.y < -kTableViewHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
            headerView.frame = headerRect
        }
        
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        //updateHeaderView()
    }
}

extension ViewController: UITableViewDataSource {

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! TableViewCell
        cell.newsItem = item
        return cell
    }
}
