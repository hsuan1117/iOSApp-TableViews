//
//  MyCustomeCell.swift
//  TableViews
//
//  Created by student on 2020/3/13.
//  Copyright © 2020 hsuan. All rights reserved.
//

import UIKit

class MyCustomeCell: UITableViewCell {
    
    //視圖中的各種元素
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
