//
//  Controlable+UIKit.swift
//  JsonParser
//
//  Created by Syed Qamar Abbas on 13/10/2022.
//

import Foundation
import UIKit

protocol UIKitControlable: Controlable {
    init()
    init(nibName: String, bundle: Bundle?)
    var model: ServiceType.Output? {get set}
    var service: ServiceType? {get set}
}


class BaseVC<S: AsyncServiceable>: UIViewController, UIKitControlable {
    
    var model: S.Output?
    var service: S?
    
    typealias ModelType = S.Output
    typealias ServiceType = S
    
    required init() {
        super.init(nibName: NSStringFromClass(Self.self), bundle: nil)
    }
    
    required init(nibName: String, bundle: Bundle?) {
        super.init(nibName: nibName, bundle: bundle)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
