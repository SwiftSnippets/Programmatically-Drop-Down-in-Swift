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
    @IBOutlet weak var selectGender2: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    var fruitDropDown: DropdownList? = nil
    var genderDropdownList: DropdownList? = nil
    var genderDropdownList2: DropdownList? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()
        fruitDropDown = DropdownList(delegate: self, dropdownTag: 1)
        genderDropdownList = DropdownList(delegate: self, dropdownTag: 2)
        genderDropdownList2 = DropdownList(delegate: self, dropdownTag: 3)
    }

    @IBAction func onClickSelectFruit(_ sender: Any) {
        let dataSource = ["Apple", "Mango", "Orange"]
        var frame = btnSelectFruit.frame
        frame = frame.offsetBy(dx: scrollView.contentOffset.x, dy: -scrollView.contentOffset.y)
        fruitDropDown?.showDropDown(frames: frame, container: self.view, data: dataSource)
    }
    
    @IBAction func selectGender2(_ sender: Any) {
        let dataSource = ["Male", "Female"]
        var frame = selectGender2.frame
        frame = frame.offsetBy(dx: scrollView.contentOffset.x, dy: -scrollView.contentOffset.y)
        genderDropdownList2?.showDropDown(frames: frame, container: self.view, data: dataSource)
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
        case 3:
            selectGender2.setTitle(item as? String, for: .normal)
        default:
            print("error")
        }
    }
}
