//
//  ViewController.swift
//  YXLog
//
//  Created by yanzhen on 2021/3/13.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction private func showLogView(_ sender: UISwitch) {
        if sender.isOn {
            YXLog.log.show()
        } else {
            YXLog.log.dismiss()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}

