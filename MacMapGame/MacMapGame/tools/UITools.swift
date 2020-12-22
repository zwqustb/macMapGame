//
//  UITools.swift
//  MacMapGame
//
//  Created by boeDev on 2020/11/25.
//  Copyright © 2020 zwq. All rights reserved.
//

import Cocoa

class UITools: NSObject {
    class func makeTwoViewSameFrame(_ view1:NSView,_ view2:NSView){
        view1.addConstraints([NSLayoutConstraint.init(item: view1, attribute: .centerX, relatedBy: .equal, toItem: view2, attribute: .centerX, multiplier: 0, constant: 0),
                              NSLayoutConstraint.init(item: view1, attribute: .centerY, relatedBy: .equal, toItem: view2, attribute: .centerY, multiplier: 0, constant: 0),
                              NSLayoutConstraint.init(item: view1, attribute: .width, relatedBy: .equal, toItem: view2, attribute: .width, multiplier: 0, constant: 0),
                              NSLayoutConstraint.init(item: view1, attribute: .height, relatedBy: .equal, toItem: view2, attribute: .height, multiplier: 0, constant: 0)])
    }
}
