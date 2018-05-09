//
//  ZDFlowLayout.swift
//  ZDIcaousel
//
//  Created by 张冬 on 2018/5/5.
//  Copyright © 2018年 张冬. All rights reserved.
//

import UIKit

/// 轮播图样式枚举
enum ZDICaouseStyleEnum {
    ///正常模式
    case ZDICaouseDefautType
    ///二变空白样式
    case ZDICaouseSpaceType
}

/**
 *  自定义collectin的layout
 */
class ZDFlowLayout: UICollectionViewFlowLayout {
    /// 二边留白模式时的比例(比例越小,留白越大)
    var offset: CGFloat = 0.8
    /// item之间的水平距离
    var spaceH: CGFloat = 1
    /// 留白时是，滚动是否使用动画
    var isAnimation: Bool = true
    private var style: ZDICaouseStyleEnum = .ZDICaouseDefautType
    convenience init(type: ZDICaouseStyleEnum) {
        self.init()
        self.style = type
    }
    override func prepare() {
        switch self.style {
        case .ZDICaouseDefautType:
            self.initLayout(scale: 1)
        case .ZDICaouseSpaceType:
            self.initLayout(scale: self.offset)
        }
    }
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        if self.style == .ZDICaouseSpaceType , self.isAnimation == true {
            var newAttrubtesArr: [UICollectionViewLayoutAttributes] = []
            if let attributesArr = super.layoutAttributesForElements(in: rect) {
                let centerX = (self.collectionView?.contentOffset.x ?? 0) + (self.collectionView?.frame.width ?? 0) * 0.5
                let itemWidth = (self.collectionView?.frame.width ?? 0) * self.offset
                for attrubt in attributesArr {
                    let space = abs(attrubt.center.x - centerX)
                    if space != 0 {
                        let scale = space/itemWidth
                        attrubt.transform = CGAffineTransform(scaleX: max(0.8, 1 - scale), y:  max(0.8, 1 - scale))
                    }
                    newAttrubtesArr.append(attrubt)
                }
            }
            return newAttrubtesArr
        }else{
            return super.layoutAttributesForElements(in: rect)
        }
    }
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        let rect = CGRect(x: proposedContentOffset.x, y: 0, width: self.collectionView?.frame.width ?? 0, height: self.collectionView?.frame.height ?? 0)
        let centerX = proposedContentOffset.x + (self.collectionView?.frame.width ?? 0) * 0.5
        var minpace: CGFloat = 0
        if let tempArr = super.layoutAttributesForElements(in: rect) {
            for attrubt in tempArr {
                if abs(minpace) > abs(attrubt.center.x - centerX) {
                    minpace =  attrubt.center.x - centerX
                }
            }
        }
        return CGPoint(x: proposedContentOffset.x + minpace, y: proposedContentOffset.y)
    }
}
extension ZDFlowLayout {
    ///设置layout的结构和初始需要的参数
    private func initLayout(scale: CGFloat){
        let collectWidth = (self.collectionView?.frame.width ?? 0) * (scale > 1 ? 1 : scale)
        let collectHeight = (self.collectionView?.frame.height ?? 0) * (scale > 1 ? 1: scale)
        self.itemSize = CGSize(width: collectWidth, height: collectHeight)
        self.minimumLineSpacing = self.spaceH
        self.scrollDirection = .horizontal
    }
}













