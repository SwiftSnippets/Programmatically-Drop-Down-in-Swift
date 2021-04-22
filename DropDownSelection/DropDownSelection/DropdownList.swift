//
//  DropdownList.swift
//  DropDownSelection
//
//  Created by Abdulsalam Mansour on 22/04/2021.
//  Copyright © 2021 SHUBHAM AGARWAL. All rights reserved.
//

import UIKit

protocol DropdownDelegate {
    func onItemSelection(item: Any?, dropdownTag: Int)
}

class CellClass: UITableViewCell {
    
}


class DropdownList: UIView {
    let tableView = UITableView()
    var selectedButtonFrame: CGRect? = nil
        
    var dataList: [Any?] = []
    var dropdownTag: Int!
    
    var delegate: DropdownDelegate!
    
    init(delegate: DropdownDelegate, dropdownTag: Int) {
        super.init(frame: .zero)
        tableView.register(CellClass.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.delegate = self
        self.dropdownTag = dropdownTag
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showDropDown(frames: CGRect, container: UIView, data: [Any?]) {
        let window = UIApplication.shared.keyWindow
        self.frame = window?.frame ?? container.frame
        container.addSubview(self)
        
        tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
        container.addSubview(tableView)
        tableView.layer.cornerRadius = 5
        selectedButtonFrame = frames
        
        self.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        self.dataList = data
        tableView.reloadData()
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(removeTransparentView))
        self.addGestureRecognizer(tapgesture)
        self.alpha = 0
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.alpha = 0.5
            self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height + 5, width: frames.width, height: CGFloat(self.dataList.count * 50))
        }, completion: nil)
    }
    
    @objc func removeTransparentView() {
        let frames = selectedButtonFrame ?? .zero
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.alpha = 0
            self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
        }, completion: nil)
    }
    
}

extension DropdownList: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = dataList[indexPath.row] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        removeTransparentView()
        delegate.onItemSelection(item: dataList[indexPath.row], dropdownTag: dropdownTag)
    }
    
}
