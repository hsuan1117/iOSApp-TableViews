//
//  DetailsView.swift
//  TableViews
//
//  Created by student on 2020/3/20.
//  Copyright © 2020 hsuan. All rights reserved.
//

import UIKit
import WebKit
class DetailsView: UIViewController {
    
    //將從前一個視圖中取得的資料
    var gotTitle : String  = ""
    var gotURL   : String  = ""
    var gotImage : UIImage = UIImage()
    
    @IBOutlet weak var WV: WKWebView!
    @IBOutlet weak var TitleText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TitleText.text = gotTitle
        WV.load(URLRequest(url: URL(string: gotURL)!))
    }
}
