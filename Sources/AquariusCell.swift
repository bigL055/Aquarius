//
//  JsonTableViewCell.swift
//  JsonTableViewCotroller
//
//  Created by bigl on 2018/1/5.
//

import UIKit
@objc(AquariusCell)
open class AquariusCell: UITableViewCell,AquariusProtocol {

  open class func verify(dict: [String : Any]) -> Bool {

    return true
  }


  open var dict: [String: Any] = [:]
  
}
