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

        // Do any additional setup after loading the view.
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
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
