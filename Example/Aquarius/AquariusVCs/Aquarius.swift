//
//  Aquarius.swift
//  Aquarius_Example
//
//  Created by bigl on 2018/1/9.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit

@objc(Router_aquarius)
class Router_aquarius: NSObject {

  @objc func router_vc(params:[String: String]) -> UIViewController? {
    guard let id = params["id"] else { return nil }
    let vc = AquariusVC(id: id)
    return vc
  }

}
