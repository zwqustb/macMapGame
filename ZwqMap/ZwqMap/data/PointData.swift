//
//  PointData.swift
//  ZwqMap
//
//  Created by boeDev on 2020/11/27.
//

import Foundation
import SwiftUI
class PointData:ObservableObject{
    @Published var aryCurPoints = [CGPoint]()
    @Published var bShowLine = false
    func addObject(_ ptCur:CGPoint){
        aryCurPoints.append(ptCur)
    }
}
