//
//  AddNewItemView.swift
//  TableViews
//
//  Created by student on 2020/4/17.
//  Copyright © 2020 hsuan. All rights reserved.
//

import UIKit
protocol DataDelegate {
    func addItem(name:String,imageName:String,description:String)
}
class AddNewItemView: UIViewController {
    var toSendData : DataDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    @IBOutlet weak var lb_description: UITextField!
    @IBOutlet weak var lb_image: UITextField!
    @IBOutlet weak var lb_name: UITextField!
    @IBAction func BtnClicked(_ sender: Any) {
        toSendData.addItem(name: lb_name.text!, imageName: lb_image.text!, description: lb_description.text!)
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
