//
//  AquariusHotGoodsCell.swift
//  Aquarius_Example
//
//  Created by bigl on 2018/1/8.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import Aquarius
import Kingfisher
import SnapKit
import SPRoutable
import SPKit
import AnyFormatProtocol

extension NSLayoutConstraint {
  /**
   Change multiplier constraint

   - parameter multiplier: CGFloat
   - returns: NSLayoutConstraint
   */
  func setMultiplier(multiplier:CGFloat) -> NSLayoutConstraint {

    NSLayoutConstraint.deactivate([self])

    let newConstraint = NSLayoutConstraint(
      item: firstItem as Any,
      attribute: firstAttribute,
      relatedBy: relation,
      toItem: secondItem,
      attribute: secondAttribute,
      multiplier: multiplier,
      constant: constant)

    newConstraint.priority = priority
    newConstraint.shouldBeArchived = self.shouldBeArchived
    newConstraint.identifier = self.identifier

    NSLayoutConstraint.activate([newConstraint])
    return newConstraint
  }
}

@objc(AquariusImages2Cell)
class AquariusImages2Cell: UITableViewCell,AquariusNibProtocol,AnyFormatProtocol {

  static func verify(dict: [String : AnyHashable]) -> Bool {
    return true
  }

  var config: [String : AnyHashable] = [:]{
    didSet{
      if let url = URL(string: format(config["icon1"])) {
        imageView1.backgroundColor = Color.random
        imageView1.kf.setImage(with: url)
      }

      if let url = URL(string: format(config["icon2"])) {
        imageView2.backgroundColor = Color.random
        imageView2.kf.setImage(with: url)
      }
      
     imageView1widthConstraint = imageView1widthConstraint.setMultiplier(multiplier: format(config["icon1Ratio"], default: 0.5))
    }
  }


  static var ratio: Double = 0.4
  @IBOutlet weak var imageView1: UIImageView!{
    didSet{
      imageView1.layer.borderColor = UIColor.black.cgColor
      imageView1.layer.borderWidth = 2
    }
  }
  @IBOutlet weak var imageView2: UIImageView!
  @IBOutlet weak var imageView1widthConstraint: NSLayoutConstraint!
  
    override func awakeFromNib() {
        super.awakeFromNib()
      contentView.layer.borderColor = UIColor.black.cgColor
      contentView.layer.borderWidth = 2
    }

    
}
