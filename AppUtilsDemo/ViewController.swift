//
//  ViewController.swift
//  AppUtilsDemo
//
//  Created by Quan Li on 2019/9/25.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AppDebugLog.debugLog(AppDeviceInfo.appName)
        AppDebugLog.debugLog(AppDeviceInfo.appVersion)
        AppDebugLog.debugLog(AppDeviceInfo.systemVersion)
        AppDebugLog.debugLog(AppDeviceInfo.hardwareString)
        AppDebugLog.debugLog(AppDeviceInfo.appBundleId)
        AppDebugLog.debugLog(AppDeviceInfo.documentPath)
        AppDebugLog.debugLog(AppDeviceInfo.cachePath)
        if AppDeviceInfo.isPhoneXSeries{
            print("这是iPhone X")
        }
        AppDebugLog.debugLog(AppDeviceInfo.bottomSpace)
        AppDebugLog.debugLog(AppDeviceInfo.navigationHeight)
        AppDebugLog.debugLog(AppDeviceInfo.statusBarHeight)
        
        
        AppDebugLog.debugLog(tabBarController?.tabBar.frame.size.height)
        AppDebugLog.debugLog(navigationHeight)
        AppDebugLog.debugLog(tabBarHeight)
        
        AppDebugLog.debugLog(AppDeviceInfo.hardwareString)
        AppDebugLog.debugLog(AppDeviceInfo.currentDevice)
        
        AppDebugLog.debugLog(AppDeviceInfo.isSimulator)
        
        AppDebugLog.debugLog(AppDeviceInfo.uuid)
        
        AppDebugLog.debugLog("123.34567".fractionDigits(2))
        AppDebugLog.debugLog("这是字符串".size(font: UIFont.systemFont(ofSize: 14)))
        
        AppDebugLog.debugLog(Date.init().secondStamp)
        AppDebugLog.debugLog(Date.init().milliSecondStamp)
        
        let password = "UserPassword1!"
        //        let key128   = "1234567890123456"                   // 16 bytes for AES128
        let key256   = "12345678901234561234567890123456"   // 32 bytes for AES256
        //        let iv       = "abcdefghijklmnop"                   // 16 bytes for AES128
        
        guard let enData = password.aesEncrypt(key: key256, iv: nil) else{
            return
        }
        let enStr = enData.toHexString()
        print(enStr)
        let deStr = Data.init(hex: enStr).aesDecrypt(key: key256, iv: nil)
        print(deStr!)
    }
    
    @IBAction func clickButton(_ sender: Any) {
        AppAuthTool.shared.userAuth { (status) in
            print(status)
        }
    }
    
}

