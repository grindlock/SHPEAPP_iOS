//
//  Post.swift
//  shpe_test
//
//  Created by Sergio Perez-Aponte on 5/4/17.
//  Copyright © 2017 Sergio Perez-Aponte. All rights reserved.
//

import Foundation
class Post{
    private var _text: String!
    private var _imageUrl: String!
    private var _posterName: String!
    private var _posterPic: String!
    private var _postKey: String!
    
    var text:String {
        return _text
    }
    
    var imageUrl: String{
        return _imageUrl
    }
    
    var posterName:String {
        return _posterName
    }
    
    var posterPic: String{
        return _posterPic
    }
    
    var postKey: String{
        return _postKey
    }
    
    init(text: String, imageUrl:String, posterName: String, posterPic: String){
        self._text = text
        self._imageUrl = imageUrl
        self._posterName = posterName
        self._posterPic = posterPic
    }
    
    init(postKey: String, postData: Dictionary<String, AnyObject>){
        self._postKey = postKey
        
        if let text = postData["text"] as? String{
            self._text = text
        }
        if let imageUrl = postData["imageUrl"] as? String{
            self._imageUrl = imageUrl
        }
        if let posterName = postData["posterName"] as? String{
            self._posterName = posterName
        }
        if let posterPic = postData["posterPic"] as? String{
            self._posterPic = posterPic
        }
    }
}
