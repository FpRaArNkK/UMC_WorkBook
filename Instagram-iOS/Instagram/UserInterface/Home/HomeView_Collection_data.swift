//
//  story_data.swift
//  Instagram
//
//  Created by 박민서 on 2023/04/29.
//

import Foundation

struct story: Codable {
    let name: String
    let image: String
    let StoryImage: String
    let time: String
    
    var isViewed: Bool
    var gotHeart: Bool
    
    init(_ name: String, _ image: String, _ StoryImage: String, _ time: String) {
        self.name = name
        self.image = image
        self.StoryImage = StoryImage
        self.time = time
        self.isViewed = false
        self.gotHeart = false
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


var story_list: [story] = []
var post_list: [post] = []

func addDummyStories() {
    story_list.append(story("Lamp","DefaultProfile","Story1","3시간"))
    story_list.append(story("Name1","Image1","Story1","5시간"))
    story_list.append(story("Name2","Image2","Story2","4시간"))
    story_list.append(story("Name3","Image3","Story3","7시간"))
    story_list.append(story("Name4","Image4","Story4","3시간"))
    story_list.append(story("Name5","Image5","Story5","1시간"))
    story_list.append(story("Name6","Image6","Story6","2시간"))
}

func addDummyPosts() {
    post_list.append(post("Name1", "Image1", "Image4", 1, "하늘이 파랗네요", 1, "5월 3일"))
    post_list.append(post("Name2", "Image2", "Image5", 2, "하늘이 빨갛네요", 2, "5월 2일"))
    post_list.append(post("Name3", "Image3", "Image6", 3, "하늘이 노랗네요", 3, "5월 1일"))
    //post(<#T##UserID: String##String#>, <#T##UserImage: String##String#>, <#T##PostImage: String##String#>, <#T##PostLike: Int##Int#>, <#T##UserText: String##String#>, <#T##CommentCount: Int##Int#>, <#T##PostDate: String##String#>)
    
}
