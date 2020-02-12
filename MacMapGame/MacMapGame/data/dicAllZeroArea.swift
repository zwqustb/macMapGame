//
//  dicAllZeroArea.swift
//  MacMapGame
//
//  Created by boeDev on 2020/1/29.
//  Copyright © 2020 zwq. All rights reserved.
//

import Cocoa

class dicAllZeroArea: NSObject {
    static let shareInstence = dicAllZeroArea()
    var dicDatas = NSMutableDictionary.init()
    
    class func saveAreaInfos(){
        let url = getFileUrl()
        shareInstence.dicDatas.write(to: url, atomically: true)
    }
    class func loadAreaInfos(){
        let url = getFileUrl()
        shareInstence.dicDatas = NSMutableDictionary.init(contentsOf: url) ?? NSMutableDictionary.init()
    }
    class func getFileUrl()->URL{
        let strUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        guard URL.init(string: "map.txt") != nil else {
            return strUrl!
        }
        let strMapPath = "\(strUrl!.absoluteString)map.txt"
        return URL.init(string: strMapPath)!
    }
}
