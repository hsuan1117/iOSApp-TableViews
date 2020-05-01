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
    func addItem(name:String,imageName:String,url:String)
}
class AddNewItemView: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    var toSendData : DataDelegate!
    let imagepicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        imagepicker.delegate = self
    }
    

    @IBAction func OnPick(_ sender: Any) {
        
        imagepicker.sourceType = .photoLibrary
        imagepicker.allowsEditing = true
        self.present(imagepicker, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let asset = info[.phAsset] as? PHAsset
        
        asset?.getURL(){
            url in
            self.lb_image.text = url?.absoluteString
        }

        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var lb_description: UITextField!
    @IBOutlet weak var lb_image: UITextField!
    @IBOutlet weak var lb_name: UITextField!
    @IBAction func BtnClicked(_ sender: Any) {
        toSendData.addItem(name: lb_name.text!, imageName: lb_image.text!, url: lb_description.text!)
        print(lb_description.text)
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
extension PHAsset {

    func getURL(completionHandler : @escaping ((_ responseURL : URL?) -> Void)){
        if self.mediaType == .image {
            let options: PHContentEditingInputRequestOptions = PHContentEditingInputRequestOptions()
            options.canHandleAdjustmentData = {(adjustmeta: PHAdjustmentData) -> Bool in
                return true
            }
            self.requestContentEditingInput(with: options, completionHandler: {(contentEditingInput: PHContentEditingInput?, info: [AnyHashable : Any]) -> Void in
                completionHandler(contentEditingInput!.fullSizeImageURL as URL?)
            })
        } else if self.mediaType == .video {
            let options: PHVideoRequestOptions = PHVideoRequestOptions()
            options.version = .original
            PHImageManager.default().requestAVAsset(forVideo: self, options: options, resultHandler: {(asset: AVAsset?, audioMix: AVAudioMix?, info: [AnyHashable : Any]?) -> Void in
                if let urlAsset = asset as? AVURLAsset {
                    let localVideoUrl: URL = urlAsset.url as URL
                    completionHandler(localVideoUrl)
                } else {
                    completionHandler(nil)
                }
            })
        }
    }
}
