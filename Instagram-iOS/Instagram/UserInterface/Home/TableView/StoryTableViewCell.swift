//
//  StoryTableViewCell.swift
//  Instagram
//
//  Created by 박민서 on 2023/05/07.
//

import UIKit

class StoryTableViewCell: UITableViewCell {
    @IBOutlet weak var CollectionView: UICollectionView!
    
    //weak var StoryCollectionViewCellDelegate: StoryCollectionViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerXib()
        registerDelegate()
        self.layer.addBorder([.bottom], color: UIColor.systemGray5, width: 1.0, set: "Normal")
    }
    
    private func registerXib(){
        
        let firststoryNib = UINib(nibName: "FirstCollectionViewCell", bundle: nil)
        CollectionView.register(firststoryNib, forCellWithReuseIdentifier: "FirstCollectionViewCell")
        let storyNib = UINib(nibName: "StoryCollectionViewCell", bundle: nil)
        CollectionView.register(storyNib, forCellWithReuseIdentifier: "StoryCollectionViewCell")
        
    }
    
    private func registerDelegate() {
        CollectionView.delegate = self
        CollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}


extension StoryTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if let cell = collectionView.cellForItem(at: indexPath) as? StoryCollectionViewCell {
//            cell.imageViewTapped()
//        }
        
        if let storedData = UserDefaults.standard.data(forKey: "Story_List"), var StoryList = try? JSONDecoder().decode([story].self, from: storedData) {
            //print("불러오기 성공")
            if StoryList[indexPath.item].isViewed == false {
                StoryList[indexPath.item].isViewed = true
                StoryList.append(StoryList.remove(at: indexPath.item))
                
                if let updateStoryList = try? JSONEncoder().encode(StoryList) {
                    UserDefaults.standard.set(updateStoryList, forKey: "Story_List")
                    UserDefaults.standard.synchronize()
                    //print("세팅도 성공")
                }
            }
        }
        
        // NotificationCenter에 옵저버 추가
        NotificationCenter.default.addObserver(self, selector: #selector(notificationReceived(_:)), name: NSNotification.Name("NotificationIdentifier"), object: nil)

        
        collectionView.reloadData()
        //print("살려주세요")

    }
    
    // 알림 수신 처리 메서드
    @objc func notificationReceived(_ notification: NSNotification) {
        // 알림 처리 코드 작성
        if let userInfo = notification.userInfo {
            // 알림과 함께 전달된 정보 사용
            let gotHeart = userInfo["gotHeart"] as? Bool
            let storyname = userInfo["storyname"] as? String
            // 사용자 정의 데이터 처리
            
            if let storedData = UserDefaults.standard.data(forKey: "Story_List"), var StoryList = try? JSONDecoder().decode([story].self, from: storedData) {
                //print("noti불러오기 성공")
                for i in 1..<StoryList.count {
                    if StoryList[i].StoryImage == storyname {
                        StoryList[i].gotHeart = gotHeart!
                        break
                    }
                }
                
                    if let updateStoryList = try? JSONEncoder().encode(StoryList) {
                        UserDefaults.standard.set(updateStoryList, forKey: "Story_List")
                        UserDefaults.standard.synchronize()
                        //print("noti세팅도 성공")
                    }
                
            }
        }
        
        // 옵저버 제거
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("NotificationIdentifier"), object: nil)
        
    }

        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return story_list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as? StoryCollectionViewCell else { return UICollectionViewCell() }

        if indexPath.item == 0 {
                    // 첫 번째 셀에 대한 특별한 처리를 수행합니다.
                    let firstCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstCollectionViewCell", for: indexPath) as! FirstCollectionViewCell
                    firstCell.UserImage.image = UIImage(named: story_list[indexPath.row].image) ?? UIImage()
            firstCell.UserImage.contentMode = .scaleAspectFill
                    firstCell.UserName.text = story_list[indexPath.row].name
                    //firstCell.layer.addBorder([.bottom], color: UIColor.systemGray5, width: 1.0)
                    return firstCell
                }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as! StoryCollectionViewCell
            
            if let storedData = UserDefaults.standard.data(forKey: "Story_List"), let StoryList = try? JSONDecoder().decode([story].self, from: storedData) {
                if StoryList[indexPath.item].isViewed {
                    cell.Color_view.backgroundColor = UIColor.gray
                }
                cell.StoryHeart = StoryList[indexPath.item].gotHeart
                cell.UserImage.image = UIImage(named: StoryList[indexPath.row].image) ?? UIImage()
                //print(cell.UserImage.image)
                cell.UserName.text = StoryList[indexPath.row].name
                //print(cell.UserName.text)
                cell.StoryImage = StoryList[indexPath.row].StoryImage
                cell.StoryTime = StoryList[indexPath.row].time
                
                cell.imageViewTappedClosure = {
                    self.collectionView(collectionView, didSelectItemAt: indexPath)
                }
            }
            return cell
        }
    }
}
