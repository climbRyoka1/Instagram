//
//  PostDate.swift
//  Instagram
//
//  Created by 両川昇 on 2019/07/28.
//  Copyright © 2019 両川昇. All rights reserved.
//

import UIKit
import Firebase

class PostData: NSObject{
    var id: String?
    var image: UIImage?
    var imageString: String?
    var name: String?
    var caption: String?
    var date: Date?
    var likes: [String] = []
    var isLiked: Bool = false
    var coment: [String] = []
    var commented: Bool = false

   
    
    init(snapshot: DataSnapshot, myId: String) {
        self.id = snapshot.key
        
        let valueDictionary = snapshot.value as! [String: Any]
        
        imageString = valueDictionary["image"] as? String
        image = UIImage(data: Data(base64Encoded: imageString!, options: .ignoreUnknownCharacters)!)
        
        self.name = valueDictionary["name"] as? String
        
        self.caption = valueDictionary["caption"] as? String
        
        let time = valueDictionary["time"] as? String
        self.date = Date(timeIntervalSinceReferenceDate: TimeInterval(time!)!)
    
       
        
        if let likes = valueDictionary["likes"] as? [String] {
            self.likes = likes
        }
        
        for likeId in self.likes {
            if likeId == myId {
                self.isLiked = true
                break
            }
        }
        
        if let coments = valueDictionary["coment"] as? [String]{
            self.coment = coments
       }
       for comentId in self.coment{
           if comentId == myId{
               self.commented = true
               break
           }
        }
    }
    
    
}


    

