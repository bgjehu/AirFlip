//
//  AirFlipBandApplication.swift
//  AirFlip
//
//  Created by Jieyi Hu on 9/23/15.
//  Copyright © 2015 fullstackpug. All rights reserved.
//

import UIKit

public class AirFlipBandApplication: NSObject, MSBApplication, MSBBandTileDelegate {
    
    private let tileId = NSUUID(UUIDString: "dc5573a4-bb0d-40b3-8a61-537762002c81")!
    public var id : NSUUID {
        get{
            return tileId
        }
    }
    private var _tile : MSBTile!
    public var tile : MSBTile {
        get{
            return _tile
        }
    }
    private var _layouts = [MSBPageLayout]()
    public var layouts : [MSBPageLayout] {
        get{
            return _layouts
        }
    }
    
    private var _pages = [MSBPageData]()
    public var pages : [MSBPageData] {
        get{
            return _pages
        }
    }
    
    private let naviPageId = NSUUID(UUIDString: "2dfb7880-fb66-43f5-ab34-82a80199d773")!
    private let returnPageId = NSUUID(UUIDString: "8078FB2D-66FB-F543-AB34-82A80199D773")!
    
    override init() {
        //  create tile
        _tile = MSBTile.create("AirFlip", tileIconName: "bandicon", smallIconName: "bandsmallicon", tileId: tileId.UUIDString)
        //_tile.screenTimeoutEnabled = false
        
        //  create prevButton
        let prevButton = MSBPageTextButton(rect: MSBPageRect(x: 0, y: 0, width: 100, height: 100))
        prevButton.elementId = 1
        prevButton.margins = MSBPageMargins(left: 10, top: 3, right: 0, bottom: 3)
        prevButton.horizontalAlignment = MSBPageHorizontalAlignment.Center
        
        //  create nextButton
        let nextButton = MSBPageTextButton(rect: MSBPageRect(x: 0, y: 0, width: 100, height: 100))
        nextButton.elementId = 2
        nextButton.margins = MSBPageMargins(left: 20, top: 3, right: 15, bottom: 3)
        nextButton.horizontalAlignment = MSBPageHorizontalAlignment.Center
        
        let naviPanel = MSBPageFlowPanel(rect: MSBPageRect(x: 0, y: 0, width: 245, height: 105))
        naviPanel.orientation = MSBPageFlowPanelOrientation.Horizontal
        naviPanel.addElements([prevButton,nextButton])

        //  add layout
        _tile.addLayout(MSBPageLayout(root: naviPanel))
        
        //  create elements data
        let prevButtonData : MSBPageTextButtonData
        let nextButtonData : MSBPageTextButtonData
        do{
            prevButtonData = try MSBPageTextButtonData(elementId: 1, text: "<-PREV")
            nextButtonData = try MSBPageTextButtonData(elementId: 2, text: "NEXT->")
            
            //  create page data
            let naviPanelContent = MSBPageData(id: naviPageId, layoutIndex: 0, value: [prevButtonData, nextButtonData])
            
            //  add page data
            _pages.append(naviPanelContent!)
        } catch let error as NSError {
            print(error)
        }
    }
    
    private static var _sharedApplication = AirFlipBandApplication()
    public static func sharedApplication() -> AirFlipBandApplication {
        return _sharedApplication
    }
    
    public func band(band: MSBBand, hadButtonPressedWithEvent event: MSBTileButtonEvent) {
        if event.pageId == returnPageId {
            if event.buttonId == UInt16(1) {
                //  prev button pressed
                NSNotificationCenter.defaultCenter().postNotificationName("com.fullstackpug.AirFlip.bandApplication.prevButtonPressed", object: nil)
                print("prev button pressed")
            } else if event.buttonId == UInt16(2) {
                //  next button pressed
                NSNotificationCenter.defaultCenter().postNotificationName("com.fullstackpug.AirFlip.bandApplication.nextButtonPressed", object: nil)
                print("next button pressed")
            }
        }
    }
}
