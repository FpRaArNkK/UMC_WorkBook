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
    
    var story_list: [story] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.StoryCollectionView.delegate = self
        self.StoryCollectionView.dataSource = self
        self.StoryCollectionView.layer.addBorder([.bottom], color: UIColor.systemGray5, width: 1.0)
        
        let firstnib = UINib(nibName: "FirstCollectionViewCell", bundle: nil)
        StoryCollectionView.register(firstnib, forCellWithReuseIdentifier: "FirstCollectionViewCell")
        let nibName = UINib(nibName: "StoryCollectionViewCell", bundle: nil)
        StoryCollectionView.register(nibName, forCellWithReuseIdentifier: "StoryCollectionViewCell")
        
        story_list.append(story("Lamp","DefaultProfile"))
        story_list.append(story("Name1","Image1"))
        story_list.append(story("Name2","Image2"))
        story_list.append(story("Name3","Image3"))
        story_list.append(story("Name4","Image4"))
        story_list.append(story("Name5","Image5"))
        story_list.append(story("Name6","Image6"))
        
        nav_bar.setBackgroundImage(UIImage(), for: .default)
        // Do any additional setup after loading the view.
        
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

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    // CollectionView item 개수
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return story_list.count
        }
        
        // CollectionView Cell의 Object
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
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
        }
        
        
        // CollectionView Cell의 Size
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width: CGFloat = collectionView.frame.width/4 - 13
            let height: CGFloat = collectionView.frame.height
            return CGSize(width: width, height: height)
        }
        
        // CollectionView Cell의 위아래 간격
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 1.0
        }
        
        // CollectionView Cell의 옆 간격
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 1.0
        }
}
