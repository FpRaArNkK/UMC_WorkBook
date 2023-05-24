//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by 박민서 on 2023/05/07.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var PostImage: UIImageView!
    @IBOutlet weak var PostLike: UILabel!
    @IBOutlet weak var UserID: UILabel!
    @IBOutlet weak var User_Text: UILabel!
    @IBOutlet weak var CommentCount: UILabel!
    @IBOutlet weak var PostDate: UILabel!
    @IBOutlet weak var Like_Button: UIButton!
    
    var postGotHeart: Bool = false
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        UserImage.layer.cornerRadius = 0.5 * UserImage.bounds.size.width
        UserImage.clipsToBounds = true
        PostImage.isUserInteractionEnabled = true
        //Like_Button.imageView?.contentMode = .scaleAspectFit
        
        let DoubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTap))
        DoubleTap.numberOfTapsRequired = 2
        //DoubleTap.numberOfTouchesRequired = 1
        self.PostImage.addGestureRecognizer(DoubleTap)
        
        let HeartTap = UITapGestureRecognizer(target: self, action: #selector(heartTap))
        HeartTap.numberOfTapsRequired = 1
        HeartTap.numberOfTouchesRequired = 1
        self.Like_Button.addGestureRecognizer(HeartTap)
        
        
    }
    
    @objc func doubleTap (_ sender: UITapGestureRecognizer) {
        let image_midx = self.PostImage.frame.midX
        let image_midy = self.PostImage.frame.midY
        let WhiteHeartImageView = UIImageView(frame: CGRect(x: image_midx - 85, y: image_midy - 85, width: 0, height: 0))
        WhiteHeartImageView.center = self.PostImage.center
//        print(self.PostImage.center)
//        print(WhiteHeartImageView.center)
        
        WhiteHeartImageView.image = UIImage(named: "WhiteHeart")
        PostImage.addSubview(WhiteHeartImageView)
        
        postGotHeart = true
        
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.4, animations: {
            WhiteHeartImageView.bounds.size = CGSize(width: 170, height: 170)
            //WhiteHeartImageView.frame = CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: 170, height: 170)
            //0에서 커지는 애니메이션
        }, completion: { (_) in
            UIView.animate(withDuration: 0.3, delay: 0.0, options: [], animations:{
                WhiteHeartImageView.bounds.size = CGSize(width: 5, height: 5)
                WhiteHeartImageView.alpha = 0.7
//                WhiteHeartImageView.layoutIfNeeded()
//                self.layoutIfNeeded()
                print("이게 도대체 언제야")
                //WhiteHeartImageView.layoutIfNeeded()
                //WhiteHeartImageView.frame = CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: 0, height: 0)
                //170에서 작아지는 애니메이션
            }, completion: { (_) in
                WhiteHeartImageView.removeFromSuperview()
                print("너는 언젠데?")
                //이미지를 뷰에서 제거 - 안필요할지도
            })
        })
        
        
        
    }
    
    @objc func heartTap (_ sender: UITapGestureRecognizer) {
        if postGotHeart == true {
            Like_Button.setImage(UIImage(named: "Heart"), for: .normal)
            postGotHeart = false
        }else if postGotHeart == false {
            //print(Like_Button.currentImage?.size.width,Like_Button.currentImage?.size.height)
            Like_Button.setImage(UIImage(named: "RedHeart"), for: .normal)
            //Like_Button.transform = CGAffineTransform.identity
            Like_Button.imageView?.center = Like_Button.center
            //print(Like_Button.currentImage?.size.width,Like_Button.currentImage?.size.height)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.2, animations: {
                self.Like_Button.imageView?.bounds.size = CGSize(width: 40, height: 40)
                //self.Like_Button.transform = CGAffineTransform(scaleX: 2, y: 2)
                //self.Like_Button.imageView!.layer.frame = CGRect(x: self.Like_Button.imageView!.frame.minX, y: self.Like_Button.imageView!.frame.minY, width: 50, height: 50)
                print("1,",self.Like_Button.imageView!.layer.frame.size.height)
                //self.Like_Button.transform = CGAffineTransform.identity
            }, completion: {finished in
                print("2,",self.Like_Button.imageView!.layer.frame.size.height)
                //self.Like_Button.imageView!.frame = CGRect(x: self.Like_Button.imageView!.frame.minX, y: self.Like_Button.imageView!.frame.minY, width: 40, height: 40)
            })
            
            postGotHeart = true
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    
    func setData(_ post: post) {
        self.UserID.text = post.UserID
        self.UserName.text = post.UserID
        self.UserImage.image = UIImage(named: post.UserImage) ?? UIImage()
        self.PostImage.image = UIImage(named: post.PostImage) ?? UIImage()
        self.PostLike.text = "좋아요 \(post.PostLike)개"
        self.User_Text.text = post.UserText
        self.CommentCount.text = "댓글 \(post.CommentCount)개 모두 보기"
        self.PostDate.text = post.PostDate
    }
    
}
