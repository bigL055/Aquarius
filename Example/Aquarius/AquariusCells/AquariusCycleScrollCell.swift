//
//  AquariusCycleScrollCell.swift
//  Aquarius_Example
//
//  Created by linhey on 2018/2/6.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import Aquarius

@objc(AquariusCycleScrollCell)
class AquariusCycleScrollCell: UITableViewCell,AquariusProtocol {

  static func verify(dict: [String : AnyHashable]) -> Bool {
    return true
  }

  var config: [String : AnyHashable] = [:]

  static var ratio: Double = 0.4


  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
