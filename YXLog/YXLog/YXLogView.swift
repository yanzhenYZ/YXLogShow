//
//  YXLogView.swift
//  YXLog
//
//  Created by yanzhen on 2021/3/13.
//

import UIKit

class YXLogView: YXMoveView {
    
    private var scroll = true
    private var logs = [(String, UIColor)]()
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var segment: UISegmentedControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.register(UINib(nibName: "YXLogCell", bundle: nil), forCellReuseIdentifier: "YXLogCell")
    }
    
    @IBAction private func segmentAction(_ sender: UISegmentedControl) {
        if segment.selectedSegmentIndex == 0 {//norml
            scroll = true
        } else if segment.selectedSegmentIndex == 1 {//scroll
            scroll = false
        } else if segment.selectedSegmentIndex == 2 {//clear
            logs.removeAll()
            tableView.reloadData()
        } else if segment.selectedSegmentIndex == 3 {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "YXLOGVIEWCLOSE"), object: nil, userInfo: nil)
            segment.selectedSegmentIndex = 0
            scroll = true
        }
    }
    
    func addLog(_ log: String, color: UIColor) {
        logs.append((log, color))
        tableView.reloadData()
        if scroll {
            let indexPath = IndexPath(row: logs.count - 1, section: 0)
            tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
}

extension YXLogView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return logs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "YXLogCell", for: indexPath) as! YXLogCell
        let info = logs[indexPath.row];
        cell.contentLabel.text = info.0
        cell.contentLabel.textColor = info.1
        return cell
    }
}
