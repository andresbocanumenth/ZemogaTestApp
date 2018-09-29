//
//  URLBase.swift
//  ZemogaTestApp
//
//  Created by Andres on 9/28/18.
//  Copyright © 2018 Andres. All rights reserved.
//

import Foundation

enum ZemongaEnvironment {
    case dev, stg, prod
}

extension ZemongaEnvironment {
    var contentBaseURl: String {
        switch self {
        case .dev:
            return "https://jsonplaceholder.typicode.com/"
        case .stg:
            return ""
        case .prod:
            return ""
        }
    }
}


