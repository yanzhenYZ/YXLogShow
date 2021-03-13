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
    private var moveView: YXLogMoveView!
    private weak var superView: UIView?
    private override init() {
        moveView = YXLogMoveView(frame: CGRect(x: 10, y: 10, width: 65, height: 65))
        moveView.backgroundColor = .gray
        
        logView = YXLogView(frame: .zero)
        logView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        logView.layer.cornerRadius = 5
        logView.backgroundColor = .gray
    }
}

extension YXLog {
    func start(_ view: UIView?) {
        end()
        if view != nil {
            superView = view
        } else {
            superView = UIApplication.shared.keyWindow
        }
        superView?.addSubview(moveView)
    }
    
    func end() {
        superView = nil
        logView.removeFromSuperview()
        moveView.removeFromSuperview()
    }
    
    func dismiss() {
        logView.removeFromSuperview()
    }
}
