//
//  YXLogView.swift
//  YXLog
//
//  Created by yanzhen on 2021/3/13.
//

import UIKit

class YXLogView: YXMoveView {
    @IBOutlet private weak var segment: UISegmentedControl!
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        if segment.selectedSegmentIndex == 0 {//norml
            
        } else if segment.selectedSegmentIndex == 1 {//scroll
            
        } else if segment.selectedSegmentIndex == 2 {//clear
            
        } else if segment.selectedSegmentIndex == 3 {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "YXLOGVIEWCLOSE"), object: nil, userInfo: nil)
            segment.selectedSegmentIndex = 0
        }
    }
    
}
