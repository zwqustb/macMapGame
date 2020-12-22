//
//  terrainMap.swift
//  MacMapGame
//
//  Created by boeDev on 2020/11/25.
//  Copyright © 2020 zwq. All rights reserved.
//

import Cocoa

class TerrainMap: NSScrollView {
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        addMenu()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        // Drawing code here.
    }
    func addMenu(){
        let menu = NSMenu.init(title: "Copy")
//        menu.autoenablesItems = false
        let newItem = NSMenuItem.init(title: "startDraw", action: #selector(showDrawView), keyEquivalent: "")
        newItem.isEnabled = true
        newItem.target = self
        menu.addItem(newItem)
        self.menu = menu
        
    }
    @objc func showDrawView()  {
        
    }
}
