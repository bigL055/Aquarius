//
//  AquariusHotGoodsCell.swift
//  Aquarius_Example
//
//  Created by bigl on 2018/1/8.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import Aquarius

@objc(AquariusHotGoodsCell)
class AquariusHotGoodsCell: UITableViewCell,AquariusNibProtocol {

  static func verify(dict: [String : AnyHashable]) -> Bool {
    return true
  }

  var dict: [String : AnyHashable] = [:]

  static var ratio: Double = 0.4


  @IBOutlet @objc weak var imageView1: UIImageView!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
