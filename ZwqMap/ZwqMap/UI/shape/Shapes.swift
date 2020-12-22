//
//  Shapes.swift
//  ZwqMap
//
//  Created by boeDev on 2020/11/26.
//
import SwiftUI
import Foundation
//系统自带的shape有Circle
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}
struct Arc: InsettableShape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool

    var insetAmount: CGFloat = 10
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment

        var path = Path()
        let side = min(rect.width, rect.height)
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: side / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)

        return path
    }
}
struct Flower: Shape {
    // 花瓣移离中心多少距离
    var petalOffset: Double = -20

    // 每片花瓣的宽度
    var petalWidth: Double = 100

    func path(in rect: CGRect) -> Path {
        // 容纳所有花瓣的路径
        var path = Path()

        // 从0向上计数到 pi * 2，每次移动 pi / 8
        for number in stride(from: 0, to: CGFloat.pi * 2, by: CGFloat.pi / 8) {
            // 根据循环旋转当前的花瓣
            let rotation = CGAffineTransform(rotationAngle: number)

            // 将花瓣移到我们视野的中心
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))

            // 使用我们的属性以及固定的Y和高度为该花瓣创建路径
            let originalPetal = Path(ellipseIn: CGRect(x: CGFloat(petalOffset), y: 0, width: CGFloat(petalWidth), height: rect.width / 2))

            // 将我们的旋转/位置变换应用于花瓣
            let rotatedPetal = originalPetal.applying(position)

            // 将其添加到我们的主路径
            path.addPath(rotatedPetal)
        }

        // 现在将主径 return
        return path
    }
}
