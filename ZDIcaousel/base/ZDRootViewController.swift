//
//  ZDRootViewController.swift
//  ZDIcaousel
//
//  Created by 张冬 on 2018/5/4.
//  Copyright © 2018年 张冬. All rights reserved.
//

import UIKit
import ImageIO
import CoreImage

class ZDRootViewController: ZDBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let imagView = UIImageView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 300))
        imagView.contentMode = .scaleAspectFit
        if let path = Bundle.main.path(forResource: "IMG_0831", ofType: "JPG") , let image =  UIImage(contentsOfFile: path) {
            imagView.image = image
            
        }
        self.view.addSubview(imagView)
    }
    
}
