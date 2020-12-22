//
//  TouchableMap.swift
//  ZwqMap
//
//  Created by boeDev on 2020/12/18.
//

import Foundation
import SwiftUI
struct TouchableMap: View {
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest(entity: SavedPoint.entity(), sortDescriptors: [])private var aryPoints: FetchedResults<SavedPoint>
    //触控map的区域
    @State public var rect: CGRect = CGRect()
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    @EnvironmentObject private var ptData:PointData

    var body: some View {
        DrawingMap(aryPoints:ptData.aryCurPoints,bShowLine: ptData.bShowLine).stroke(Color.red, style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
//                    .frame(width: 400, height: CGFloat(drawViewInfo_H), alignment: .center)
                    .background(Color.gray)
                    .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .global).onEnded({ (value) in
                        let ptLoc = value.location
                        print("点击的位置,x:\(ptLoc.x),y:\(ptLoc.y)")
                        let xInSuper = ptLoc.x - rect.origin.x
                        let windowHeight = kWindowHeight
                        print("windowHeight:\(windowHeight)")
                        let viewBottomPosFromB = windowHeight - rect.height - rect.origin.y
                        print("viewBottomPosFromB:\(viewBottomPosFromB)")
                        let yInSuperFromTop = rect.size.height - (ptLoc.y - viewBottomPosFromB)
                        print("yInSuperFromTop:\(yInSuperFromTop)")
                        let ptInSuperFromLT = CGPoint.init(x: xInSuper, y: yInSuperFromTop)
                        ptData.addObject(ptInSuperFromLT)
                        let point = SavedPoint(context: self.moc)
                        point.tips = "test"
                        point.xPos = Int64(ptInSuperFromLT.x)
                        point.yPos = Int64(ptInSuperFromLT.y)
                        try?self.moc.save()
                    }))
        
    }
}
