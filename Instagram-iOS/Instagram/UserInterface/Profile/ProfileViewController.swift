//
//  ProfileViewController.swift
//  Instagram
//
//  Created by 서은수 on 2022/09/19.
//

import UIKit


class ProfileViewController: UIViewController, sendDataDelegate {
    
    func sendData(data: Array<String>) {
        data_inc = data
    }
    
    var data_inc: [String] = ["umc_ios","가천대학교 UMC iOS","umc ios 트랙 짱","www.makeus.in/umc"]
    
    @IBOutlet weak var umc_ios: UIBarButtonItem!
    @IBOutlet weak var name: UIBarButtonItem!
    @IBOutlet weak var user_name: UILabel!
    @IBOutlet weak var intro: UILabel!
    @IBOutlet weak var link: UIButton!
    
    @IBAction func tap_EP(_ sender: Any) {
        guard let EProfileVC =
                        self.storyboard?.instantiateViewController(withIdentifier: "EditProfileVC")
                else { return }

                self.navigationController?.pushViewController(EProfileVC, animated: true)
    }
    
    private func nameDist() {
        name.title = data_inc[0]
        user_name.text = data_inc[1]
        intro.text = data_inc[2]
        link.setTitle(data_inc[3], for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("ViewDidLoad")
        
        umc_ios.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .bold)],for: .normal)
        nameDist()
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

