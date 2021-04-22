//
//  ViewController.swift
//  DropDownSelection
//
//  Created by SHUBHAM AGARWAL on 26/07/19.
//  Copyright © 2019 SHUBHAM AGARWAL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnSelectFruit: UIButton!
    @IBOutlet weak var btnSelectGender: UIButton!
        
    var fruitDropDown: DropdownList? = nil
    var genderDropdownList: DropdownList? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fruitDropDown = DropdownList(delegate: self, dropdownTag: 1)
        genderDropdownList = DropdownList(delegate: self, dropdownTag: 2)
    }

    @IBAction func onClickSelectFruit(_ sender: Any) {
        let dataSource = ["Apple", "Mango", "Orange"]
        fruitDropDown?.showDropDown(frames: btnSelectFruit.frame, container: self.view, data: dataSource)
    }
    
    @IBAction func onClickSelectGender(_ sender: Any) {
        let dataSource = ["Male", "Female"]
        genderDropdownList?.showDropDown(frames: btnSelectGender.frame, container: self.view, data: dataSource)
    }
}


extension ViewController: DropdownDelegate {
    func onItemSelection(item: Any?, dropdownTag: Int) {
        switch dropdownTag {
        case 1:
            btnSelectFruit.setTitle(item as? String, for: .normal)
        case 2:
            btnSelectGender.setTitle(item as? String, for: .normal)
        default:
            print("error")
        }
    }
}
