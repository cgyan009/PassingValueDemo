//
//  MainViewController.swift
//  ValueTransferDemo
//
//  Created by Chenguo Yan on 2019-11-19.
//  Copyright © 2019 Chenguo Yan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, PassDataBack {
    func passData(_ data: String) {
        self.valueFromDelegate.text = "this is passed back via delegate \(data)"
        print("this is passed back \(data)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBOutlet weak var valueFromDelegate: UILabel!
    
    @IBAction func goToSecondScreen(_ sender: Any) {
        if let inputValue = inputValueTextField.text {
            if !inputValue.isEmpty {
                print(inputValue)
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let secondVC = storyBoard.instantiateViewController(withIdentifier: "secondScreen") as! SecondViewController
                
                secondVC.delegate = self
                secondVC.testValue = inputValue
                secondVC.callBack = { text in
                    self.valueFromSecondScreen.text = "this is passed back via closure \(text)"
                }
                self.navigationController?.pushViewController(secondVC, animated: true)
            }
        }
    }
    @IBOutlet weak var valueFromSecondScreen: UILabel!
    @IBOutlet weak var inputValueTextField: UITextField!
    
}
