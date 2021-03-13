//
//  YXLog.swift
//  YXLog
//
//  Created by yanzhen on 2021/3/13.
//

import UIKit

class YXLog: NSObject {

    public static let log = YXLog()
    private var logView: YXLogView!
    
    private override init() {
        logView = YXLogView(frame: .zero)
        logView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        logView.layer.cornerRadius = 5
        logView.backgroundColor = .gray
    }
}

extension YXLog {
    func show(_ frame: CGRect = CGRect(x: 0, y: 0, width: 180, height: 240)) {
        dismiss()
        logView.frame = frame
        UIApplication.shared.keyWindow?.addSubview(logView)
    }
    
    func dismiss() {
        logView.removeFromSuperview()
    }
}
