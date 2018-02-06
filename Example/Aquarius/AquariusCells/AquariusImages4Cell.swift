//
//  AquariusImages4Cell.swift
//  Aquarius_Example
//
//  Created by bigl on 2018/1/9.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import Aquarius
import Kingfisher
import SnapKit
import SPRoutable
import SPKit
import AnyFormatProtocol

@objc(AquariusImages4Cell)
class AquariusImages4Cell: UITableViewCell,AquariusNibProtocol,AnyFormatProtocol {
  
  static func verify(dict: [String : AnyHashable]) -> Bool {
    return true
  }

  static var ratio: Double = 0.4

  
  var config: [String : AnyHashable] = [:] {
    didSet{
      if config == oldValue { return }
     heightRatio = heightRatio.change(multiplier: format(config["center_y"], default: 0.5.cgFloat))
     widthRatio = widthRatio.change(multiplier: format(config["center_x"], default: 0.5.cgFloat))
      print(heightRatio.multiplier,widthRatio.multiplier)
      btns.enumerated().forEach { (item) in
        if let configItem = config["\(item.offset)"] as? [String: AnyHashable] {
          if let url = URL(string: format(configItem["icon"])) {
//            item.element.kf.setImage(with: url, for: .normal)
          }
          item.element.setTitle(format(configItem["title"]), for: .normal)
          item.element.add(for: .touchUpInside) {
            if let vc = Routable.viewController(url: self.format(configItem["routable"])) {
              self.sp.viewController?.sp.push(vc: vc, animated: true)
            }
          }
          
        }
      }
    }
  }

  @IBOutlet weak var heightRatio: NSLayoutConstraint!
  @IBOutlet weak var widthRatio: NSLayoutConstraint!
  @IBOutlet weak var btn0: UIButton!
  @IBOutlet weak var btn1: UIButton!
  @IBOutlet weak var btn2: UIButton!

  var btns: [UIButton] {
    return [btn0,btn1,btn2]
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    contentView.layer.borderColor = UIColor.red.cgColor
    contentView.layer.borderWidth = 2
  }
  
  
}
