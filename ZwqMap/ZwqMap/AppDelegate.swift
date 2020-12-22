//
//  AppDelegate.swift
//  ZwqMap
//
//  Created by boeDev on 2020/11/26.
//

import Cocoa
import SwiftUI
@main
class AppDelegate: NSObject, NSApplicationDelegate,NSWindowDelegate {
    
    var window: NSWindow!
    
    var m_pPointData:PointData!
    //MARK:application delegate bgn
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        m_pPointData = PointData.init()
        //初始化下coredata数据
        self.saveCoreData()
        let contentView = ContentView().environment(\.managedObjectContext, persistentContainer.viewContext).environmentObject(m_pPointData)
        // Create the window and set the content view.
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
        
        window.delegate = self
        refreshWindowHW(window)
       
        
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    
    
    func windowWillReturnUndoManager(window: NSWindow) -> UndoManager? {
        // Returns the NSUndoManager for the application. In this case, the manager returned is that of the managed object context for the application.
        return persistentContainer.viewContext.undoManager
    }
    
    func applicationShouldTerminate(_ sender: NSApplication) -> NSApplication.TerminateReply {
        // Save changes in the application's managed object context before the application terminates.
        let context = persistentContainer.viewContext
        
        if !context.commitEditing() {
            NSLog("\(NSStringFromClass(type(of: self))) unable to commit editing to terminate")
            return .terminateCancel
        }
        
        if !context.hasChanges {
            return .terminateNow
        }
        
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            
            // Customize this code block to include application-specific recovery steps.
            let result = sender.presentError(nserror)
            if (result) {
                return .terminateCancel
            }
            
            let question = NSLocalizedString("Could not save changes while quitting. Quit anyway?", comment: "Quit without saves error question message")
            let info = NSLocalizedString("Quitting now will lose any changes you have made since the last successful save", comment: "Quit without saves error question info");
            let quitButton = NSLocalizedString("Quit anyway", comment: "Quit anyway button title")
            let cancelButton = NSLocalizedString("Cancel", comment: "Cancel button title")
            let alert = NSAlert()
            alert.messageText = question
            alert.informativeText = info
            alert.addButton(withTitle: quitButton)
            alert.addButton(withTitle: cancelButton)
            
            let answer = alert.runModal()
            if answer == .alertSecondButtonReturn {
                return .terminateCancel
            }
        }
        // If we got here, it is time to quit.
        return .terminateNow
    }
    //MARK:window delegate bgn
    func windowWillResize(_ sender: NSWindow, to frameSize: NSSize) -> NSSize {
        kWindowHeight = frameSize.height
        kWindowWidth = frameSize.width
        return frameSize
    }
    func windowDidResize(_ notification: Notification) {
        refreshWindowHW(window)
    }
    func refreshWindowHW(_ pWindow:NSWindow){
        //let rtWindowContent = window.contentRect(forFrameRect: window.frame)
        let rtWindowContent = window.contentLayoutRect
        kWindowHeight = rtWindowContent.size.height
        kWindowWidth = rtWindowContent.size.width
    }
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "ZwqMap")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving and Undo support
    
    @IBAction func saveAction(_ sender: AnyObject?) {
        self.saveCoreData()
    }
    func saveCoreData(){
        let context = persistentContainer.viewContext
        
        if !context.commitEditing() {
            NSLog("\(NSStringFromClass(type(of: self))) unable to commit editing before saving")
        }
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Customize this code block to include application-specific recovery steps.
                let nserror = error as NSError
                NSApplication.shared.presentError(nserror)
            }
        }
    }
    func deleteAllCoreData(){
        let context = persistentContainer.viewContext
        let result = getAllData()
        // 循环删除所有数据
        for person in result {
            context.delete(person)
        }
        saveCoreData()
    }
    // 获取所有数据
    func getAllData() -> [SavedPoint] {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest = SavedPoint.fetchRequest()
        do {
            let result = try context.fetch(fetchRequest)
            return result
        } catch {
            fatalError();
        }
    }
    //MARK:点击目录触发的方法
    
    @IBAction func clickPointMenu(_ sender: NSMenuItem) {
        let title = sender.title
        if title.contains("刷新页面") {
            if m_pPointData.bShowLine {
                m_pPointData.bShowLine = false
            }
            m_pPointData.bShowLine = true
        }else if title.contains("保存"){
            self.saveCoreData()
        }else if title.contains("清除"){
            m_pPointData.aryCurPoints.removeAll()
            m_pPointData.bShowLine = false
        }else if title.contains("清空"){
            self.deleteAllCoreData()
            m_pPointData.aryCurPoints.removeAll()
            m_pPointData.bShowLine = false
        }
    }
}

