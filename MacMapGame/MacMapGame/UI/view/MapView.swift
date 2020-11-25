//
//  MapView.swift
//  MacMapGame
//
//  Created by boeDev on 2020/11/18.
//  Copyright © 2020 zwq. All rights reserved.
//

import Cocoa

class MapView: NSCollectionView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
//    override func updateTrackingAreas() {
//        for oldArea in self.trackingAreas {
//            self.removeTrackingArea(oldArea)
//        }
////        let area = NSTrackingArea.init(rect: self.bounds, options: .activeInActiveApp, owner: self, userInfo: nil)
////        self.addTrackingArea(area)
//    }
    override func mouseExited(with event: NSEvent) {
        print("exit")
    }
    override func scrollWheel(with event: NSEvent) {
        print("wheel")
        //let scrollDir = event.deltaX
//        print("deltaX:\(event.deltaX)")
//        print("deltaY:\(event.deltaY)")
//        print("deltaZ:\(event.deltaZ)")
//        print("deltaX-:\(event.scrollingDeltaX)")
        print("deltaY-:\(event.scrollingDeltaY)")
        let bScrollBig = event.scrollingDeltaY > 0
        if  MapConfig.scaleTo(big: bScrollBig) {
            //向上滚
//            self.siz
            let nWith = MapConfig.getMapItemWidth()
            let nHeight = MapConfig.getMapItemHeight()
            let layout = NSCollectionViewLayout.init()
            //layout.it
            self.reloadData()
        }
        print("mapConfig:\(MapConfig.nMapLevel)")
//        print("deltaZ-:\(event.deltaZ)")
    }
//    override var collectionViewLayout: NSCollectionViewLayout?
}
