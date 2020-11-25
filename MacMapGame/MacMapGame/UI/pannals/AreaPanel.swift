//
//  AreaPanel.swift
//  MacMapGame
//
//  Created by boeDev on 2020/1/28.
//  Copyright © 2020 zwq. All rights reserved.
//

import Cocoa

class AreaPanel: NSView {
    
    
    @IBOutlet weak var btnSave: NSButton!
    @IBOutlet weak var btnChangeArea: NSButton!
    @IBOutlet var pXibView: NSView!
    @IBOutlet weak var lPostion: NSTextField!
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        wantsLayer = true
        canDrawSubviewsIntoLayer = true
        if Bundle.main.loadNibNamed("Panels", owner: self, topLevelObjects: nil) {
            addSubview(pXibView)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    func setPostion(_ x:Int){
        
    }
    
}
