//
//  SecondViewController.swift
//  ExpertWorkBook
//
//  Created by 박민서 on 2023/04/15.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
 
    @IBOutlet weak var result: UILabel!
    
    @IBAction func go_back(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    var result_text: String? = "Default"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        result.text = result_text
        
    }


}

