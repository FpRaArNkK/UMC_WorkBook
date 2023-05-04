//
//  HomeViewController.swift
//  Instagram
//
//  Created by 박민서 on 2023/04/29.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var nav_bar: UINavigationBar!
    @IBOutlet weak var StoryCollectionView: UICollectionView!
    @IBOutlet weak var PostCollectionView: UICollectionView!
    
    var story_list: [story] = []
    var post_list: [post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nav_bar.setBackgroundImage(UIImage(), for: .default)
        addDummyStories()
        addDummyPosts()
        
        self.StoryCollectionView.delegate = self
        self.StoryCollectionView.dataSource = self
        self.StoryCollectionView.layer.addBorder([.bottom], color: UIColor.systemGray5, width: 1.0)
        
        self.PostCollectionView.delegate = self
        self.PostCollectionView.dataSource = self
        self.PostCollectionView.layer.addBorder([.bottom], color: UIColor.systemGray5, width: 1.0)
        
        let FirstStoryNib = UINib(nibName: "FirstCollectionViewCell", bundle: nil)
        StoryCollectionView.register(FirstStoryNib, forCellWithReuseIdentifier: "FirstCollectionViewCell")
        let SeconStoryNib = UINib(nibName: "StoryCollectionViewCell", bundle: nil)
        StoryCollectionView.register(SeconStoryNib, forCellWithReuseIdentifier: "StoryCollectionViewCell")
        
        let PostNib = UINib(nibName: "PostCollectionViewCell", bundle: nil)
        PostCollectionView.register(PostNib, forCellWithReuseIdentifier: "PostCollectionViewCell")
        
        
    }
    
    
    func addDummyStories() {
        story_list.append(story("Lamp","DefaultProfile"))
        story_list.append(story("Name1","Image1"))
        story_list.append(story("Name2","Image2"))
        story_list.append(story("Name3","Image3"))
        story_list.append(story("Name4","Image4"))
        story_list.append(story("Name5","Image5"))
        story_list.append(story("Name6","Image6"))
    }
    
    func addDummyPosts() {
        post_list.append(post("Name1", "Image1", "Image4", 1, "하늘이 파랗네요", 1, "5월 3일"))
        post_list.append(post("Name2", "Image2", "Image5", 2, "하늘이 빨갛네요", 2, "5월 2일"))
        post_list.append(post("Name3", "Image3", "Image6", 3, "하늘이 노랗네요", 3, "5월 1일"))
        //post(<#T##UserID: String##String#>, <#T##UserImage: String##String#>, <#T##PostImage: String##String#>, <#T##PostLike: Int##Int#>, <#T##UserText: String##String#>, <#T##CommentCount: Int##Int#>, <#T##PostDate: String##String#>)
        
    }

}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        // CollectionView item 개수
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            if collectionView == StoryCollectionView {
                return story_list.count
            } else /*if collectionView == PostCollectionView*/ {
                return post_list.count
            }
        }
        
        // CollectionView Cell의 Object
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            if collectionView == StoryCollectionView {
                if indexPath.item == 0 {
                            // 첫 번째 셀에 대한 특별한 처리를 수행합니다.
                            let firstCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstCollectionViewCell", for: indexPath) as! FirstCollectionViewCell
                            firstCell.UserImage.image = UIImage(named: story_list[indexPath.row].image) ?? UIImage()
                            firstCell.UserName.text = story_list[indexPath.row].name
                            return firstCell
                        }
                else {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as! StoryCollectionViewCell
                    cell.UserImage.image = UIImage(named: story_list[indexPath.row].image) ?? UIImage()
                    cell.UserName.text = story_list[indexPath.row].name
                    return cell
                }
            } else /*if collectionView == PostCollectionView*/ {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCollectionViewCell", for: indexPath) as! PostCollectionViewCell
                cell.UserID.text = post_list[indexPath.row].UserID
                cell.UserName.text = post_list[indexPath.row].UserID
                cell.UserImage.image = UIImage(named: post_list[indexPath.row].UserImage) ?? UIImage()
                cell.PostImage.image = UIImage(named: post_list[indexPath.row].PostImage) ?? UIImage()
                cell.PostLike.text = "좋아요 \(post_list[indexPath.row].PostLike)개"
                cell.User_Text.text = post_list[indexPath.row].UserText
                cell.CommentCount.text = "댓글 \(post_list[indexPath.row].CommentCount)개 모두 보기"
                cell.PostDate.text = post_list[indexPath.row].PostDate
                return cell
            }
        }
        
        
        // CollectionView Cell의 Size
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            if collectionView == StoryCollectionView {
                let width: CGFloat = collectionView.frame.width/4 - 5
                let height: CGFloat = collectionView.frame.height
                return CGSize(width: width, height: height)
            } else /*if collectionView == PostCollectionView*/ {
                let width: CGFloat = collectionView.frame.width
                let height: CGFloat = collectionView.frame.height
                return CGSize(width: width, height: height)
            }
            
        }
        
        // CollectionView Cell의 위아래 간격
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            if collectionView == StoryCollectionView {
                return 1.0
            } else /*if collectionView == PostCollectionView*/ {
                return 0.0
            }
        }
        
        // CollectionView Cell의 옆 간격
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            if collectionView == StoryCollectionView {
                return 1.0
            } else /*if collectionView == PostCollectionView*/ {
                return 0.0
            }
        }
}
