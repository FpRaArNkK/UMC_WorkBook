//
//  StoryCollectionViewCell.swift
//  Instagram
//
//  Created by 박민서 on 2023/04/30.
//

import UIKit

//protocol StoryCollectionViewCellDelegate: AnyObject {
//    func didTapImageInCell(_ cell: StoryCollectionViewCell)
//}

class StoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var Color_view: UIView!
    @IBOutlet weak var White_View: UIView!
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var UserName: UILabel!
    
    var StoryImage: String = ""
    var StoryTime: String = ""
    var StoryHeart: Bool = false
    
    var imageViewTappedClosure: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        Color_view.layer.cornerRadius = 0.5 * Color_view.bounds.size.width
        Color_view.clipsToBounds = true
        White_View.layer.cornerRadius = 0.5 * White_View.bounds.size.width
        White_View.clipsToBounds = true
        UserImage.layer.cornerRadius = 0.5 * UserImage.bounds.size.width
        UserImage.clipsToBounds = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
        UserImage.addGestureRecognizer(tapGesture)
        UserImage.isUserInteractionEnabled = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        Color_view.backgroundColor = UIColor.green
        self.StoryImage = ""
        self.StoryTime = ""
        self.StoryHeart = false
    }
    
    @objc func imageViewTapped() {
        let StoryViewController = StoryViewController()
        StoryViewController.modalPresentationStyle = .fullScreen
        StoryViewController.userNameText = UserName.text ?? "user_name_err"
        StoryViewController.userImageText = UserImage.image?.accessibilityIdentifier ?? "user_image_err"
        StoryViewController.userTimeText = StoryTime
        StoryViewController.userStoryImageText = StoryImage
        StoryViewController.gotHeart = StoryHeart
        
        
        imageViewTappedClosure?()
        
        UIApplication.shared.keyWindow?.rootViewController?.present(StoryViewController, animated: true)
        }

}

