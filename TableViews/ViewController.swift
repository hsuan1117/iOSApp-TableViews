//
//  ViewController.swift
//  TableViews
//
//  Created by student on 2020/3/13.
//  Copyright © 2020 hsuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate ,DataDelegate,UISearchBarDelegate{

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            self.filteredData = data
        }else{
            self.filteredData = self.data.filter({
                return $0.title.lowercased().contains(searchText.lowercased())
            })
            UsingTableView.reloadData()
        }
    }
    @IBOutlet weak var UsingTableView: UITableView!
    
    var data : [Introducer] = []
    var filteredData : [Introducer] = []
    func addItem(title: String, image: UIImage, url: String) {
        data.append(Introducer(title: title, image: image, url: url))
        filteredData = data
        UsingTableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UsingTableView.dequeueReusableCell(withIdentifier: "myCell") as! MyCustomeCell
        cell.cellTitle?.text   = filteredData[indexPath.row].title
        cell.cellImage?.image  = filteredData[indexPath.row].image
        cell.cellContent?.text = filteredData[indexPath.row].url
        return cell
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = deleteItem(at: indexPath.row)
        return UISwipeActionsConfiguration(actions: [delete])
    }
    func deleteItem(at:Int) -> UIContextualAction{
        
        let action = UIContextualAction(style: .destructive, title: "刪除") {
            (action,view,handler) in
            self.data.remove(at: at)
            self.filteredData = self.data
            self.UsingTableView.reloadData()
        }
        action.backgroundColor = .red
        return action
    }
    
    @IBOutlet weak var SearchController: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data.append(Introducer(title: "Hsuan", image: UIImage(named: "person1")!, url: "https://air.hsuan.app"))
        data.append(Introducer(title: "Google" , image: UIImage(named: "person1")!, url: "https://google.com.tw"))
        filteredData = data
        SearchController.delegate = self
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
                
                ToWhere.gotTitle = data[indexPath.row].title
                ToWhere.gotURL   = data[indexPath.row].url
                ToWhere.gotImage = data[indexPath.row].image
            }
        }
    }
    
}

