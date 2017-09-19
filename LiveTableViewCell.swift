//
//  LiveTableViewCell.swift
//  YKLineStream
//
//  Created by 许 振辉 on 2017/7/11.
//  Copyright © 2017年 许 振辉. All rights reserved.
// 控制器 视图组装

import UIKit

class LiveTableViewCell: UITableViewCell {

    @IBOutlet var imgPor: UIImageView!
    @IBOutlet var labelNick: UILabel!
    @IBOutlet var labelAddr: UILabel!
    @IBOutlet var labelViewers: UILabel!
    @IBOutlet var imgBigPor: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
