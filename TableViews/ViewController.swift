//
//  ViewController.swift
//  TableViews
//
//  Created by student on 2020/3/13.
//  Copyright © 2020 hsuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate ,DataDelegate{
    
    
    @IBOutlet weak var UsingTableView: UITableView!
    
    var data : [String : [String]] = [
        "Silly Man":["person1","He is a man"],
        "Hsuan":["person2","He is strange"]
    ]
    func addItem(name: String, imageName: String, description: String) {
        var x : [String] = []
        x.append(imageName)
        x.append(description)
        data[name] = x
        UsingTableView.reloadData()
    }
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
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = deleteItem(at: indexPath.row)
        return UISwipeActionsConfiguration(actions: [delete])
    }
    func deleteItem(at:Int) -> UIContextualAction{
        
        let action = UIContextualAction(style: .destructive, title: "刪除") {
            (action,view,handler) in
            self.data.removeValue(forKey: Array(self.data.keys)[at])
            self.UsingTableView.reloadData()
        }
        action.backgroundColor = .red
        return action
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        UsingTableView.delegate = self
        UsingTableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addNew" {
            let target = segue.destination as! AddNewItemView
            target.toSendData = (self as DataDelegate)
        }else{
            if let indexPath = UsingTableView.indexPathForSelectedRow {
                let ToWhere = segue.destination as! DetailsView
                //print(UsingTableView.indexPathForSelectedRow?.item)
                //ToWhere.TitleText.text = "Array(data.keys)[0]"
                ToWhere.gotTitle = Array(data.keys)[indexPath.row]
            }
        }
    }

}

