//
//  BuildManager.swift
//  ZemogaTestApp
//
//  Created by Andres on 9/28/18.
//  Copyright © 2018 Andres. All rights reserved.
//

import Foundation

class BuildManager: NSObject {
    static let shared = BuildManager()
    let currentBuildEnviornment : ZemongaEnvironment
    
    /// App current version number
    let appVersionNumber: String = {
        return (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String) ?? ""
    }()
    
    /// App current build number
    let appBuildNumber: String = {
        return (Bundle.main.infoDictionary?["CFBundleVersion"] as? String) ?? ""
    }()
    
    /// App current version and build number. e.x "1.0(4)"
    var appVersionAndBuildNumber: String {
        return "\(appVersionNumber)(\(appBuildNumber))"
    }
    
    override init() {
        currentBuildEnviornment = .dev
    }
}
