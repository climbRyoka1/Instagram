//
//  SettingViewController.swift
//  Instagram
//
//  Created by 両川昇 on 2019/07/23.
//  Copyright © 2019 両川昇. All rights reserved.
//

import UIKit
import Firebase
import ESTabBarController
import SVProgressHUD

class SettingViewController : UIViewController{
    
    @IBOutlet weak var displayNameTextField: UITextField!
    
    @IBAction func hundleChangeButton(_ sender: Any) {
        if let displayName = displayNameTextField.text{
            if displayName.isEmpty{
                SVProgressHUD.showError(withStatus: "表示名を入力してください")
                return
            }
            let user = Auth.auth().currentUser
            if let user = user{
                let changeRequest = user.createProfileChangeRequest()
                changeRequest.commitChanges{ error in
                    if let error = error{
                        SVProgressHUD.showError(withStatus: "表示名の設定に失敗しました")
                        print("DEBUG_POINT:" + error.localizedDescription)
                        return
                    }
                        print("DEBUG_POINT: [displayName = \(user.displayName!)]の設定に成功しました。")
                    SVProgressHUD.showSuccess(withStatus: "表示名を変更しました")
                    self.view.endEditing(true)
                }
            }
        }
    }
    
    @IBAction func hundleLogoutButton(_ sender: Any) {
        try! Auth.auth().signOut()
        
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "Login")
        self.present(loginViewController!, animated: true, completion: nil)
        
        let tabBarController = parent as! ESTabBarController
        tabBarController.setSelectedIndex(0, animated: false)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        
        let user = Auth.auth().currentUser
        if let user = user{
            displayNameTextField.text = user.displayName
        }
    }
    
    
    
    
}
