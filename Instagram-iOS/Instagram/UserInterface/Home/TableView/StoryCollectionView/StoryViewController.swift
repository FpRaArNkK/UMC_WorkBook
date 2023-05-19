//
//  StoryViewController.swift
//  Instagram
//
//  Created by 박민서 on 2023/05/18.
//

import UIKit

class StoryViewController: UIViewController {

    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var StoryTime: UILabel!
    @IBOutlet weak var ProgressView: UIProgressView!
    @IBOutlet weak var UserImage: UIButton!
    @IBOutlet weak var DotButton: UIButton!
    @IBOutlet weak var XButton: UIButton!
    @IBOutlet weak var HeartButton: UIButton!
    @IBOutlet weak var ShareButton: UIButton!
    @IBOutlet weak var MessageText: UITextField!
    @IBOutlet weak var StoryImage: UIImageView!
    

    @IBAction func didTapXmark(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func didTapHeart(_ sender: Any) {
            if HeartButton.currentImage?.accessibilityIdentifier! == "Heart" {
                HeartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                // 알림 게시
                let notification = Notification(name: Notification.Name("NotificationIdentifier"), object: nil, userInfo: ["gotHeart": true, "storyname": userStoryImageText])
                NotificationCenter.default.post(notification)

            } else if HeartButton.currentImage?.accessibilityIdentifier! == "heart.fill" {
                HeartButton.setImage(UIImage(named:"Heart")?.withRenderingMode(.alwaysTemplate), for: .normal)
                HeartButton.tintColor = UIColor.white
                // 알림 게시
                let notification = Notification(name: Notification.Name("NotificationIdentifier"), object: nil, userInfo: ["gotHeart": false, "storyname": userStoryImageText])
                NotificationCenter.default.post(notification)

            }
    }

    
    var userNameText: String = ""
    var userImageText: String = ""
    var userTimeText: String = ""
    var userStoryImageText: String = ""
    var gotHeart: Bool = false
    
    var timer: Timer?
    var progress: Float = 0.0
    let totalTime: Float = 5.0
    let interval: TimeInterval = 0.01
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSource()
        ProgressView.transform = CGAffineTransform(scaleX: 1.0, y: 2.0 / ProgressView.frame.size.height)
        ProgressView.progressTintColor = UIColor.white.withAlphaComponent(0.7)
        ProgressView.trackTintColor = UIColor.white.withAlphaComponent(0.4)
        
        DotButton.setWhite(ImageName: "Ellipsis")
        XButton.setWhite(ImageName: "xmark")
        ShareButton.setWhite(ImageName: "Share")
        
        if gotHeart {
            HeartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            HeartButton.setImage(UIImage(named:"Heart")?.withRenderingMode(.alwaysTemplate), for: .normal)
            HeartButton.tintColor = UIColor.white

        }
        
        UserImage.layer.cornerRadius = 0.5 * UserImage.bounds.size.width
        UserImage.clipsToBounds = true
        
        StoryImage.layer.cornerRadius = 0.02 * StoryImage.bounds.size.width
        StoryImage.clipsToBounds = true
        
        MessageText.textColor = UIColor.white
        MessageText.borderStyle = .roundedRect
        MessageText.layer.borderColor = UIColor.white.withAlphaComponent(0.7).cgColor
        MessageText.layer.borderWidth = 1.0
        MessageText.layer.cornerRadius = 22.0
        MessageText.backgroundColor = UIColor.clear
        MessageText.attributedPlaceholder = NSAttributedString(string: "   메시지 보내기", attributes: [.foregroundColor: UIColor.white])
        
        timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func updateProgress() {
        progress += Float(interval) / totalTime
                ProgressView.progress = progress
                
                if progress >= 1.0 {
                    timer?.invalidate()
                    timer = nil
                }
    }
    
    func setSource(){
        UserName.text = userNameText
        UserImage.setImage(UIImage(named: userImageText) ?? UIImage(), for: .normal)
        StoryTime.text = userTimeText
        StoryImage.image = UIImage(named: userStoryImageText) ?? UIImage()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent // 밝은 배경에 어두운 글꼴
    }

}


extension UIButton {
    func setWhite(ImageName: String){
        self.setImage(UIImage(named: ImageName)?.withRenderingMode(.alwaysTemplate), for: .normal)
        self.tintColor = UIColor.white
        self.backgroundColor = UIColor.clear
    }
}


