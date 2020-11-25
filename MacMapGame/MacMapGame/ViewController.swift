//
//  ViewController.swift
//  MacMapGame
//
//  Created by boeDev on 2020/1/26.
//  Copyright © 2020 zwq. All rights reserved.
//

import Cocoa

class ViewController: NSViewController,NSCollectionViewDelegate,NSCollectionViewDataSource {

    
    lazy var m_areaPanel = AreaPanel.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 400))
    //地图
    @IBOutlet weak var m_pCollectView: NSCollectionView!
    //顶部文本
    @IBOutlet weak var lManPower: NSTextField!
    @IBOutlet weak var lSkills: NSTextField!
    @IBOutlet weak var lWeapon: NSTextField!
    @IBOutlet weak var lMapLevel: NSTextField!
    @IBOutlet weak var lTime: NSTextField!
    
    
    var curSelectIndex:IndexPath = [0,0]
    override func viewDidLoad() {
        super.viewDidLoad()
        //全屏
//        var pWindow = NSApplication.shared.keyWindow
//        pWindow = NSApplication.shared.windows.last
//        pWindow?.toggleFullScreen(nil)
        //四边形地图
        m_pCollectView.register(CollectionViewItem.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier(rawValue: "CollectionViewItem"))
        m_pCollectView.delegate = self
        m_pCollectView.dataSource = self
        //控制台
        m_areaPanel.wantsLayer = true
        m_areaPanel.layer?.backgroundColor = NSColor.white.cgColor
        // Do any additional setup after loading the view.
//        NotificationCenter.default.addObserver(self, selector: <#T##Selector#>, name: <#T##NSNotification.Name?#>, object: <#T##Any?#>)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
        //MARK:mark collection delegate
    //地图区块被点击
    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        collectionView.deselectItems(at: indexPaths)
        let pItem = collectionView.item(at: curSelectIndex) as? CollectionViewItem
        pItem?.setSelectUI(false)
        let pIndex = indexPaths.first
        if pIndex != nil {
            curSelectIndex = pIndex!
            let pItem = collectionView.item(at: curSelectIndex) as? CollectionViewItem
            pItem?.setSelectUI(true)
            self.view.addSubview(m_areaPanel)
        }
        //m_areaPanel.setPostion(pIndex?.count ?? 0)
    }

    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return MapConfig.getTotalNum()
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let pItem = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "CollectionViewItem"), for: indexPath)
          
        return pItem
    }

    deinit {
        
    }
}

      
