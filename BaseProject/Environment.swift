//
//  Environment.swift
//  BaseProject
//
//  Created by Daniela Riesgo on 6/27/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

internal enum Environment {
    
    case development
    case alpha
    case beta
    case production
    
}

internal extension Environment {
    
    static var current: Environment {
        #if DEVELOPMENT
            return .development
        #endif
        #if ALPHA
            return .alpha
        #endif
        #if BETA
            return .beta
        #endif
        #if PRODUCTION
            return .production
        #endif
    }

}

internal extension Environment {
    
    private static let EnvironmentKey = "ENVIRONMENT"
    
    // This property should be set in scheme Test action's arguments (environment variables).
    private static let EnvironmentTest = "Test"
    
    // This property should be set in UITests by launchEnvironment arguments.
    private static let EnvironmentUITest = "UITest"
    
    static var isTestTarget: Bool {
        let environment = ProcessInfo.processInfo.environment
        return environment[Environment.EnvironmentKey] == Environment.EnvironmentTest
    }
    
    static var isUITestTarget: Bool {
        let environment = ProcessInfo.processInfo.environment
        return environment[Environment.EnvironmentKey] == Environment.EnvironmentUITest
    }
    
}

internal extension Environment {

    static var isRunningOnSimulator: Bool {
        #if (arch(i386) || arch(x86_64)) && os(iOS)
            return true
        #else
            return false
        #endif
    }
    
}
