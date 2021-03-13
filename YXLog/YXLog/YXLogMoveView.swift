//
//  YXLogMoveView.swift
//  YXLog
//
//  Created by yanzhen on 2021/3/13.
//

import UIKit

class YXLogMoveView: UIView {

    private var beginPoint = CGPoint.zero
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 5
        backgroundColor = UIColor.gray
        
//        let imageView = UIImageView(frame: bounds)
//        imageView.contentMode = .center
//        imageView.image = #imageLiteral(resourceName: "setting")
//        addSubview(imageView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(settingAction))
        addGestureRecognizer(tap)
    }
    
    @objc private func settingAction() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "YXMOVEVIEWACTION"), object: nil, userInfo: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        beginPoint = (touches.first?.location(in: self))!
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let point = touches.first?.location(in: self)
        var c = center
        c.x += point!.x - beginPoint.x
        c.y += point!.y - beginPoint.y
        center = c
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        adjustFrame()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        adjustFrame()
    }
    
    private func adjustFrame() {
        let screenSize = UIScreen.main.bounds.size
        var rect = frame
        if rect.origin.x < 0 {
            rect.origin.x = 0
        } else if rect.maxX > screenSize.width {
            rect.origin.x = screenSize.width - bounds.size.width
        }
        
        if rect.origin.y < 0 {
            rect.origin.y = 0
        } else if rect.maxY > screenSize.height {
            rect.origin.y = screenSize.height - bounds.size.height
        }
        
        UIView.animate(withDuration: 0.2) {
            self.frame = rect
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
