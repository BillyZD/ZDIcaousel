//
//  ZDBaseViewController.swift
//  ZDIcaousel
//
//  Created by 张冬 on 2018/5/4.
//  Copyright © 2018年 张冬. All rights reserved.
//

import UIKit

/// 当前屏幕宽度
let SCREEN_WIDTH: CGFloat = UIScreen.main.bounds.size.width

/// 当前屏幕高度
let SCRENN_HEIGHT: CGFloat = UIScreen.main.bounds.size.height

class ZDBaseViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    }
}
