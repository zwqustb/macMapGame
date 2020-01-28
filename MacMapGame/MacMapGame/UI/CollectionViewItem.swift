//
//  CollectionViewItem.swift
//  MacMapGame
//
//  Created by boeDev on 2020/1/27.
//  Copyright © 2020 zwq. All rights reserved.
//

import Cocoa

class CollectionViewItem: NSCollectionViewItem {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    func setSelectUI(_ bSelect:Bool){
        if bSelect {
            self.view.layer!.borderColor = NSColor.red.cgColor
            self.view.layer?.borderWidth = 2
        }else{
            self.view.layer!.borderColor = NSColor.black.cgColor
            self.view.layer?.borderWidth = 1
        }
    }
}
