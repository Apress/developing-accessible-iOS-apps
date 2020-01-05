//
//  NibLoadable].swift
//  DevelopingAccessibleApps
//
//  Created by Daniel Devesa Derksen-Staats on 04/05/2019.
//  Copyright © 2019 Desfici Ltd. All rights reserved.
//

import UIKit

protocol NibLoadable: class {
    
    static func loadFromNib() -> Self?
    static func loadFromNib(withName name: String) -> Self?
}

extension NibLoadable where Self: UIView {
    
    static func loadFromNib() -> Self? {
        
        let viewClassName = String(describing: self)
        
        return loadFromNib(withName: viewClassName)
    }
    
    static func loadFromNib(withName name: String) -> Self? {
        
        let bundle = Bundle(for: self)
        let views = bundle.loadNibNamed(name, owner: nil, options: nil)
        let firstView = views?.first
        
        return firstView as? Self
    }
}
