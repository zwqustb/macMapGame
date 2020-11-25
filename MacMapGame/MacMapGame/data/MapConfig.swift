//
//  MapConfig.swift
//  MacMapGame
//
//  Created by boeDev on 2020/11/18.
//  Copyright © 2020 zwq. All rights reserved.
//

import Cocoa
let kScreenWidth = NSScreen.main?.frame.size.width ?? 0
let kScreenHeight = NSScreen.main?.frame.size.height ?? 0
class MapConfig: NSObject {
    static var nMapLevel = 0
    static var strMapLevel = ["村","县","市","省","国","洲"]
    //4,8,16,32
    //3,6,12,24
    //12,48,192,768,3072,12288
    //x,y方向上的基础个数
    static var aryMapLevelSize = [4,3]
    class func getTotalNum()->Int{
        let scaleCount = pow(Float(2), Float(nMapLevel))
        let nCount = 12*scaleCount*scaleCount
        return Int(nCount)
    }
    class func getMapItemWidth()->Float{
        let baseNum = aryMapLevelSize.first!
        let scaleCount = pow(Float(2), Float(nMapLevel))
        let perWidth = kScreenWidth/(CGFloat(baseNum)*CGFloat(scaleCount))
        return Float(max(perWidth, 100))
    }
    class func getMapItemHeight()->Float{
        let baseNum = aryMapLevelSize.last!
        let scaleCount = pow(Float(2), Float(nMapLevel))
        let perSide = kScreenHeight/(CGFloat(baseNum)*CGFloat(scaleCount))
        return Float(max(perSide, 100))
    }
    class func getXCount()->Int{
        let baseNum = aryMapLevelSize.first!
        let scaleCount = pow(Float(2), Float(nMapLevel))
        let xCount = baseNum * Int(scaleCount)
        return xCount
    }
    //返回值表示是否发生了改变
    class func scaleTo(big:Bool)->Bool{
        if big {
            if nMapLevel < strMapLevel.count - 1 {
                self.nMapLevel += 1
                return true
            }
        }else{
            if nMapLevel > 0{
                self.nMapLevel -= 1
                return true
            }
        }
        return false
    }
    class func getItemFrame(_ index:Int)->CGRect{
        let width = CGFloat(getMapItemWidth())
        let height = CGFloat(getMapItemHeight())
        let baseNum = aryMapLevelSize.first!
        let xTotal = pow(Float(2), Float(nMapLevel))*Float(baseNum)
        let yIndex = index/Int(xTotal)
        let xIndex = index%Int(xTotal)
       // let reRect = CGRect.init(x: (xIndex-1)*width, y: (yIndex-1)*height, width: width, height: height)
        
        return CGRect.init(x: CGFloat(xIndex-1)*width, y: CGFloat(yIndex-1)*height, width: width, height: height)

    }
}
