//
//  Response.swift
//  ZemogaTestApp
//
//  Created by Andres on 9/28/18.
//  Copyright © 2018 Andres. All rights reserved.
//

import Foundation

enum Response<T> {
    case success(T)
    case failure(ServiceErrorCode)
}

public enum ServiceErrorCode : Int {
    case generic = 0, serviceFailure
    
    var message: String {
        switch self {
        case .serviceFailure:
            return "ups we are sorry the application encountered an error during processing"
        case .generic:
            return "Generic Error"
        }
    }
}
