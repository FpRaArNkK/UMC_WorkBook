//
//  EditProfile.swift
//  Instagram
//
//  Created by 박민서 on 2023/04/16.
//

import UIKit

protocol sendDataDelegate {
    func sendData(data : Array<String>)
}


extension CALayer {
    func addBorder(_ arr_edge: [UIRectEdge], color: UIColor, width: CGFloat, set: String = "Normal") {
        for edge in arr_edge {
            let border = CALayer()
            switch edge {
                        case UIRectEdge.top:
                            border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: width)
                            break
                        case UIRectEdge.bottom:
                            if set == "Normal" {
                                    border.frame = CGRect.init(x: 0, y: frame.height - width, width: frame.width, height: width)
                            } else if set == "textfield" {
                                border.frame = CGRect.init(x: 0, y: frame.height - width + 10, width: self.bounds.width - 20, height: width)
                                print("조정된?",self.bounds.width)
                                print("원본",frame.width)
                            }
                            break
                        case UIRectEdge.left:
                            border.frame = CGRect.init(x: 0, y: 0, width: width, height: frame.height)
                            break
                        case UIRectEdge.right:
                            border.frame = CGRect.init(x: frame.width - width, y: 0, width: width, height: frame.height)
                            break
                        default:
                            break
                        }
            border.backgroundColor = color.cgColor;
                        self.addSublayer(border)
        }
    }
}



class EditProfileViewController: UIViewController {
    var delegate: sendDataDelegate?
    
    @IBOutlet weak var photo_view: UIView!
    @IBOutlet weak var info_view: UIView!
    @IBOutlet weak var tap1_view: UIView!
    @IBOutlet weak var tap2_view: UIView!
    @IBOutlet weak var tap3_view: UIView!
    
    @IBOutlet weak var name_text: UITextField!
    @IBOutlet weak var user_text: UITextField!
    @IBOutlet weak var intro_text: UITextField!
    @IBOutlet weak var link_text: UITextField!
    
    var data: [String] = ["","","",""]
    //weak var delegate: ProfileEdit_Delegate?
    
    @IBAction func tap_cancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func tap_insert(_ sender: Any) {
        
        guard let nameText = name_text.text else {return}
        guard let userNameText = user_text.text else {return}
        guard let introText = intro_text.text else {return}
        guard let linkText = link_text.text else {return}
        
        data[0] = nameText
        data[1] = userNameText
        data[2] = introText
        data[3] = linkText
        
        delegate?.sendData(data: data)
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(data)
        
        self.navigationController?.navigationBar.layer.addBorder([.bottom], color: UIColor.systemGray5, width: 1.0)

        photo_view.layer.addBorder([.bottom], color: UIColor.systemGray5, width: 1.0)
        info_view.layer.addBorder([.bottom], color: UIColor.systemGray5, width: 1.0)
        tap1_view.layer.addBorder([.bottom], color: UIColor.systemGray5, width: 1.0)
        tap2_view.layer.addBorder([.bottom], color: UIColor.systemGray5, width: 1.0)
        name_text.layer.addBorder([.bottom], color: UIColor.systemGray5, width: 1.0, set: "textfield")
        user_text.layer.addBorder([.bottom], color: UIColor.systemGray5, width: 1.0, set: "textfield")
        intro_text.layer.addBorder([.bottom], color: UIColor.systemGray5, width: 1.0, set: "textfield")

    }
    
}
