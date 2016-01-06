//
//  UserPreferences.swift
//  AirFlip
//
//  Created by Jieyi Hu on 9/23/15.
//  Copyright © 2015 fullstackpug. All rights reserved.
//

class UserPreferences: NSObject {
    static var useAppleWatch : Bool {
        get{
            return NSUserDefaults.standardUserDefaults().boolForKey("CONNECT_APPLE_WATCH")
        }
    }
    static var useMicrosoftBand : Bool {
        get{
            let a = NSUserDefaults.standardUserDefaults().boolForKey("CONNECT_MICROSOFT_BAND")
            return a
        }
    }
    static var showButtonsUponPresentation : Bool {
        get{
            return NSUserDefaults.standardUserDefaults().boolForKey("SHOW_BUTTONS_UPON_PRESENTATION")
        }
    }
    static var allowWearableDeviceControl : Bool {
        get{
            return NSUserDefaults.standardUserDefaults().boolForKey("ALLOW_WEARABLE_DEVICE_CONTROL")
        }
    }
    static var allowHandGestureControl : Bool {
        get{
            return NSUserDefaults.standardUserDefaults().boolForKey("ALLOW_HAND_GESTURE_CONTROL")
        }
    }
}
