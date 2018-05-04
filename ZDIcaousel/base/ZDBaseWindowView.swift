//
//  ZDBaseWindowView.swift
//  ZDIcaousel
//
//  Created by 张冬 on 2018/5/4.
//  Copyright © 2018年 张冬. All rights reserved.
//

import UIKit
class ZDBaseWindowView: UIWindow {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        debugPrint("点击窗口")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
