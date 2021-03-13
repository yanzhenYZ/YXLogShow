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
        super.init()
        moveView = YXLogMoveView(frame: CGRect(x: 10, y: 10, width: 65, height: 65))
        moveView.backgroundColor = .gray
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "YXMOVEVIEWACTION"), object: nil, queue: .main) { [weak self] (note) in
            guard let self = self else { return }
            if self.logView.superview != nil {
                self.logView.removeFromSuperview()
                self.moveView.isHidden = false
            } else {
                self.moveView.isHidden = true
                self.superView?.addSubview(self.logView)
            }
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "YXLOGVIEWCLOSE"), object: nil, queue: .main) { [weak self] (note) in
            guard let self = self else { return }
            self.logView.removeFromSuperview()
            self.moveView.isHidden = false
        }
        
        logView = Bundle.main.loadNibNamed("YXLogView", owner: nil, options: nil)?.first as? YXLogView
        logView.frame = CGRect(x: 0, y: 0, width: 270, height: 360)
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
