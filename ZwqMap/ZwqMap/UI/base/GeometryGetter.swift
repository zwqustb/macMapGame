//
//  File.swift
//  ZwqMap
//
//  Created by boeDev on 2020/12/18.
//

import Foundation
import SwiftUI
struct GeometryGetter: View {
    @Binding var rect: CGRect
    
    var body: some View {
        return GeometryReader { geometry in
            self.makeView(geometry: geometry)
        }
    }
    
    func makeView(geometry: GeometryProxy) -> some View {
        DispatchQueue.main.async {
            self.rect = geometry.frame(in: .global)
        }

        return Rectangle().fill(Color.clear)
    }
}
