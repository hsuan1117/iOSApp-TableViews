//
//  ViewController.swift
//  TableViews
//
//  Created by student on 2020/3/13.
//  Copyright © 2020 hsuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var UsingTableView: UITableView!
    var data = ["A","B","C","D"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UsingTableView.dequeueReusableCell(withIdentifier: "myCell") as! MyCustomeCell
        //cell?.cellTitle.text = "Ha"
        cell.cellTitle?.text = data[indexPath.row]
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        UsingTableView.delegate = self
        UsingTableView.dataSource = self
    }


}

