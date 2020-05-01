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
    var gotTitle = ""
    var gotURL = ""
    var gotImage = ""
    
    @IBOutlet weak var WV: WKWebView!
    @IBOutlet weak var TitleText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        TitleText.text = gotTitle
        WV.load(URLRequest(url: URL(string: gotURL)!))
        
        
    }
}
