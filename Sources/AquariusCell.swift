//
//  JsonTableViewCell.swift
//  JsonTableViewCotroller
//
//  Created by bigl on 2018/1/5.
//

import UIKit
@objc(AquariusCell)
open class AquariusCell: UITableViewCell,AquariusProtocol {

  public static var ratio: Double {
    return 0.1
  }

  public var dict: [String : AnyHashable] = [:]

  open class func verify(dict: [String : AnyHashable]) -> Bool {
    return true
  }

}
