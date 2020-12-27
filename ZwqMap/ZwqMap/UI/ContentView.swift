//
//  ContentView.swift
//  ZwqMap
//
//  Created by boeDev on 2020/11/26.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: SavedPoint.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \SavedPoint.groupIndex, ascending: true),NSSortDescriptor(keyPath: \SavedPoint.index, ascending: true)],predicate: nil) var aryPoints: FetchedResults<SavedPoint>
    
    @State private var rtTouch = CGRect.init()

    @EnvironmentObject private var ptData:PointData
    var body: some View {
        VStack{
            GeometryReader { geometry -> TouchableMap in
                let frame = geometry.frame(in: CoordinateSpace.local)
                return TouchableMap(rect: frame)
            }
            List(aryPoints, id: \.self) { pAny in
                let pt = pAny as SavedPoint
                Text("x:\(pt.x),y:\(pt.y),group:\(pt.groupIndex),index:\(pt.index)")
            }.frame(width: nil, height: 100, alignment: .bottom)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
