//
//  TableViewCell.swift
//  Stretchy Headers
//
//  Created by Noirozr on 15/10/14.
//  Copyright © 2015年 Yongjia Liu. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    var categoryLabel: UILabel?
    var summaryLabel: UILabel?
    var newsItem: NewsItem? {
        didSet {
            if let item = newsItem {
                categoryLabel?.text = item.category.toString()
                categoryLabel?.textColor = item.category.toColor()
                summaryLabel?.text = item.summary
            } else {
                categoryLabel?.text = nil
                summaryLabel?.text = nil
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        p_constructSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //print("called")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    private func p_constructSubviews() {
        let categoryLabel = UILabel()
        self.addSubview(categoryLabel)
        categoryLabel.snp_makeConstraints() { (make) -> Void in
            make.top.equalTo(self)
            make.leading.equalTo(self).offset(14)
            make.trailing.equalTo(self)
        }
        categoryLabel.text = "Entertainment"
        categoryLabel.textColor = UIColor.purpleColor()
        self.categoryLabel = categoryLabel
        
        let summaryLabel = UILabel()
        self.addSubview(summaryLabel)
        summaryLabel.snp_makeConstraints() { (make) -> Void in
            make.top.equalTo(categoryLabel.snp_bottom).offset(5)
            make.leading.equalTo(self).offset(14)
            make.trailing.equalTo(self)
            make.bottom.equalTo(self)
        }
        
        summaryLabel.text = "Dystopian films continue rule over box office with 'Maze Runner'"
        summaryLabel.numberOfLines = 0
        self.summaryLabel = summaryLabel
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
