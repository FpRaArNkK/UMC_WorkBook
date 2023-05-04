//
//  story_data.swift
//  Instagram
//
//  Created by 박민서 on 2023/04/29.
//

import Foundation

struct story {
    let name: String
    let image: String
    
    init(_ name: String, _ image: String) {
        self.name = name
        self.image = image
    }
}

struct post {
    let UserImage: String
    let PostImage: String
    let PostLike: Int
    let UserID: String
    let UserText: String
    let CommentCount : Int
    let PostDate: String
    
    init(_ UserID: String, _ UserImage: String,_ PostImage: String, _ PostLike: Int, _ UserText: String, _ CommentCount: Int, _ PostDate: String) {
        self.UserID = UserID
        self.UserImage = UserImage
        self.PostImage = PostImage
        self.PostLike = PostLike
        self.UserText = UserText
        self.CommentCount = CommentCount
        self.PostDate = PostDate
    }
    
}
