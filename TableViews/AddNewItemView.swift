//
//  AddNewItemView.swift
//  TableViews
//
//  Created by student on 2020/4/17.
//  Copyright © 2020 hsuan. All rights reserved.
//

import UIKit
import Photos
protocol DataDelegate {
    func addItem(title:String , image:UIImage , url:String)
}
class AddNewItemView: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var lb_description: UITextField!
    @IBOutlet weak var lb_name: UITextField!
    
    var toSendData : DataDelegate!
    var pickedImg : UIImage = UIImage()
    let imagepicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagepicker.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        pickedImg = (info[.originalImage] as? UIImage)!
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func OnPick(_ sender: Any) {
        
        imagepicker.sourceType = .photoLibrary
        imagepicker.allowsEditing = true
        self.present(imagepicker, animated: true)
    }
    @IBAction func BtnClicked(_ sender: Any) {
        toSendData.addItem(title: lb_name.text!, image: UIImage(), url: lb_description.text!)
        navigationController?.popViewController(animated: true)
    }
    
}
