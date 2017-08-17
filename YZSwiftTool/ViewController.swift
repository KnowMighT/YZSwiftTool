//
//  ViewController.swift
//  YZSwiftTool
//
//  Created by wyc on 2017/8/17.
//  Copyright © 2017年 Desperado. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func shwo(_ sender: Any) {
        
//        AlertShowTool.showSureAlert(title: "提示", message: "这不是演习~~", controller: self, sureTitle: "确定") {
//            print("完毕")
//        }
        
        AlertShowTool.showSheet(title: "提示", message: "请选择", delegate: self) { 
            print("取消了")
        }
    }
    

}

