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
    var data : [String : [String]] = [
        "Silly Man":["person1","He is a man"],
        "Emperor":["person2","He is strange"]
    ]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UsingTableView.dequeueReusableCell(withIdentifier: "myCell") as! MyCustomeCell
        
        cell.cellTitle?.text = Array(data.keys)[indexPath.row]
        cell.cellContent?.text = data[Array(data.keys)[indexPath.row]]![1]
        cell.cellImage?.image = UIImage(named: data[Array(data.keys)[indexPath.row]]![0])
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UsingTableView.delegate = self
        UsingTableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index   = UsingTableView.indexPathForSelectedRow
        let ToWhere = segue.destination as! DetailsView
        print(index)
        ToWhere.TitleText.text = Array(data.keys)[index!.row]
        
    }

}

