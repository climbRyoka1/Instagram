//
//  PostViewController.swift
//  Instagram
//
//  Created by 両川昇 on 2019/07/23.
//  Copyright © 2019 両川昇. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class PostViewController: UIViewController{
    
    var image : UIImage!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func hundlePostButton(_ sender: Any) {
        let imageDate = imageView.image!.jpegData(compressionQuality: 0.5)
        let imageString = imageDate?.base64EncodedString(options: .lineLength64Characters)
        
        let time = Date.timeIntervalSinceReferenceDate
        let name = Auth.auth().currentUser?.displayName
        
        let postRef = Database.database().reference().child(Const.PostPath)
        let postDic = ["caption": textField.text!, "image": imageString, "time": String(time), "name": name!]
        
        postRef.childByAutoId().setValue(postDic)
        
        SVProgressHUD.showSuccess(withStatus: "投稿しました")
        
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func hundleCancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = image
    }
    
}
