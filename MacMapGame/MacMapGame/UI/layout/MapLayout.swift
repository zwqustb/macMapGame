//
//  MapLayout.swift
//  MacMapGame
//
//  Created by boeDev on 2020/11/20.
//  Copyright © 2020 zwq. All rights reserved.
//

import Cocoa

class MapLayout: NSCollectionViewLayout {
    override func layoutAttributesForInterItemGap(before indexPath: IndexPath) -> NSCollectionViewLayoutAttributes? {
        let pAttr = NSCollectionViewLayoutAttributes.init()
        pAttr.frame  = MapConfig.getItemFrame(indexPath.count)
        return pAttr
    }
    override func layoutAttributesForItem(at indexPath: IndexPath) -> NSCollectionViewLayoutAttributes? {
        let pAttr = NSCollectionViewLayoutAttributes.init()
        pAttr.frame  = MapConfig.getItemFrame(indexPath.count)
        return pAttr
    }
}
