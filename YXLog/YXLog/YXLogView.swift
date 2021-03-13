//
//  YXLogView.swift
//  YXLog
//
//  Created by yanzhen on 2021/3/13.
//

import UIKit

class YXLogView: YXMoveView {
    
    private var logs = [(String, UIColor)]()
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var segment: UISegmentedControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.register(UINib(nibName: "YXLogCell", bundle: nil), forCellReuseIdentifier: "YXLogCell")
    }
    
    @IBAction private func segmentAction(_ sender: UISegmentedControl) {
        if segment.selectedSegmentIndex == 0 {//norml
            
        } else if segment.selectedSegmentIndex == 1 {//scroll
            
        } else if segment.selectedSegmentIndex == 2 {//clear
            
        } else if segment.selectedSegmentIndex == 3 {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "YXLOGVIEWCLOSE"), object: nil, userInfo: nil)
            segment.selectedSegmentIndex = 0
        }
    }
    
    func addLog(_ log: String, color: UIColor = .blue) {
        logs.append((log, color))
    }
}

extension YXLogView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "YXLogCell", for: indexPath)
        cell.textLabel?.text = indexPath.row.description
        return cell
    }
    
    
}
