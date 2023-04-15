//
//  ViewController.swift
//  ExpertWorkBook
//
//  Created by 박민서 on 2023/04/14.
//

import Foundation
import UIKit

class FirstViewController: UIViewController {


    @IBOutlet weak var TextField: UITextField!
    
    @IBAction func didTapAction(_ sender: Any) {
        
        let data : String = TextField.text!
        
        
        if let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            
            secondViewController.result_text = data
            self.present(secondViewController, animated: true, completion: nil)
        }
        /*
        guard let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {
            return
        }
        secondViewController.result_text = data
        self.present(secondViewController, animated: true, completion: nil)
        */
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

