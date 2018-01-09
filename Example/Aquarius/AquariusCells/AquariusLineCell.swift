//
//  AquariusLineCell.swift
//  Aquarius_Example
//
//  Created by linhey on 2018/1/7.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import Aquarius
@objc(AquariusLineCell)
class AquariusLineCell: UITableViewCell,AquariusProtocol {
  
  static var ratio: Double {
    get {
      return 0.3
    }
  }


  static func verify(dict: [String : AnyHashable]) -> Bool {
    return true
  }

  var dict: [String : AnyHashable] = [:] {
    didSet{
      self.textLabel?.text = dict["text"] as? String ?? ""
    }
  }

  override func setValue(_ value: Any?, forUndefinedKey key: String) {
    print(key)
  }

}
