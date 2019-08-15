//
//  ComentViewController.swift
//  Instagram
//
//  Created by 両川昇 on 2019/08/10.
//  Copyright © 2019 両川昇. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class ComentViewController: UIViewController{
    
    
    
    @IBOutlet weak var comentText: UITextField!
    
    @IBAction func comentPostButton(_ sender: Any) {
        let alertController: UIAlertController = UIAlertController(title: "投稿しますか？", message: "yesかno", preferredStyle: .alert)
        
        let okAction: UIAlertAction = UIAlertAction(title: "YES", style: .default, handler:{ (UIAlertAction) in
            print("DEBUG_PRINT: Post")
            
            
            
             let postRef = Database.database().reference().child(Const.PostPath)
            let postDic = ["coment": self.comentText.text!]
            
           postRef.updateChildValues(postDic)
            
            
            SVProgressHUD.showSuccess(withStatus: "投稿しました")
            
            UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
        })
        
       
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "NO", style: .cancel, handler: nil)
        
         alertController.addAction(okAction)
         alertController.addAction(cancelAction)
        present(alertController,animated: true, completion: nil)
        
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
