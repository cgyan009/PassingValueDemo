//
//  SecondViewController.swift
//  ValueTransferDemo
//
//  Created by Chenguo Yan on 2019-11-19.
//  Copyright © 2019 Chenguo Yan. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var delegate: PassDataBack?
    
    var testValue: String?
    var callBack: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if testValue !=  nil {
            self.valueFromMain.text = testValue
        }
    }
    
    @IBOutlet weak var valueFromMain: UILabel!
    
    @IBOutlet weak var valueToMainScreenTextField: UITextField!
    
    @IBAction func goBackToMain(_ sender: UIButton) {
        self.valueFromMain.text = "Haha"
        guard let text = self.valueToMainScreenTextField.text else { return }
        self.delegate?.passData(text)
        self.callBack?(text)
        self.navigationController?.popViewController(animated: true)
    }
    
}
