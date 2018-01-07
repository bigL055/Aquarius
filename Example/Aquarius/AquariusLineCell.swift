//
//  AquariusLineCell.swift
//  Aquarius_Example
//
//  Created by bigl on 2018/1/7.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import Aquarius
@objc(AquariusLineCell)
class AquariusLineCell: UITableViewCell,AquariusProtocol {

  static func verify(dict: [String : Any]) -> Bool {
    return true
  }

  var dict: [String : Any] = [:] {
    didSet{
      self.textLabel?.text = dict["text"] as? String ?? ""
    }
  }

}
