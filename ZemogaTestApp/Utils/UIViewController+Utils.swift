//
//  UIViewController+Utils.swift
//  ZemogaTestApp
//
//  Created by Andres on 9/28/18.
//  Copyright © 2018 Andres. All rights reserved.
//

import UIKit
import MBProgressHUD

extension UIViewController {
    
    class func fromStoryboard(_ name: String, withIdentifier id: String? = nil) -> Self? {
        return fromStoryboard(UIStoryboard(name: name, bundle: nil), withIdentifier: id)
    }
    
    class func fromStoryboard(_ storyboard: UIStoryboard, withIdentifier id: String? = nil) -> Self? {
        return fromStoryboard(storyboard, withIdentifier: id, as: self)
    }
    
    private class func fromStoryboard<T>(_ storyboard: UIStoryboard, withIdentifier id: String? = nil, as type: T.Type) -> T? {
        return  storyboard.instantiateViewController(withIdentifier: id ?? "\(type)") as? T
    }
    
    func showLoading() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    
    func hideLoading() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}
