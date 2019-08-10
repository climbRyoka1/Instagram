//
//  ImageSelectViewController.swift
//  Instagram
//
//  Created by 両川昇 on 2019/07/23.
//  Copyright © 2019 両川昇. All rights reserved.
//

import UIKit
import CLImageEditor 

class ImageSelectViewController : UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,CLImageEditorDelegate{
    @IBAction func hundleLibraryButton(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let pickerController = UIImagePickerController()
            pickerController.delegate = self
            pickerController.sourceType = .photoLibrary
            self.present(pickerController,animated: true,completion: nil)
        }
    }
   
    @IBAction func hundleCameraButton(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let pickerController = UIImagePickerController()
            pickerController.delegate = self
            pickerController.sourceType = .camera
            self.present(pickerController,animated: true,completion: nil)
        }
    }
    
    @IBAction func hundleCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if info[.originalImage] != nil{
            let image = info[.originalImage] as! UIImage
            print("DEBUG_PRINT: image = \(image)")
            let editor = CLImageEditor(image: image)!
            editor.delegate = self
            picker.pushViewController(editor, animated: true)
            
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
       picker.dismiss(animated: true, completion: nil)
    }
    
    func imageEditor(_ editor: CLImageEditor!, didFinishEditingWith image: UIImage!) {
        let postViewController = self.storyboard?.instantiateViewController(withIdentifier: "Post") as! PostViewController
        postViewController.image = image!
        editor.present(postViewController,animated: true ,completion: nil)
    }
}
