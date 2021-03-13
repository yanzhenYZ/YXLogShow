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
        YXLog.log;
    }

    @IBAction private func showLogView(_ sender: UISwitch) {
        if sender.isOn {
            YXLog.log.start(view)
        } else {
            YXLog.log.end()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for i in 0...20 {
            YXLog.log.addLog("1234 // Do any additional setup after loading the view. // Do any additional setup after loading the view.")
        }
    }
}

