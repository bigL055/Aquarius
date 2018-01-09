//
//  AquariusImagesCell.swift
//  Aquarius_Example
//
//  Created by bigl on 2018/1/8.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import Aquarius
import Kingfisher
import SnapKit

@objc(AquariusImagesCell)
class AquariusImagesCell: UITableViewCell,AquariusProtocol {
  static func verify(dict: [String : AnyHashable]) -> Bool {
    return true
  }

  var dict: [String : AnyHashable] = [:]{
    didSet{
      if let url = URL(string: dict["icon1"] as? String ?? "") {
        imageView1.kf.setImage(with: url)
      }

      if let url = URL(string: dict["icon2"] as? String ?? "") {
        imageView2.kf.setImage(with: url)
      }
    }
  }

  static var ratio: Double = 0.4


  let imageView1 = UIImageView()
  let imageView2 = UIImageView()


  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    buildUI()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }



  private func buildUI() {
contentView.addSubview(imageView1)
    contentView.addSubview(imageView2)
    buildLayout()
    buildSubview()
  }

  private func buildLayout() {
    imageView1.snp.makeConstraints { (make) in
      make.top.left.bottom.equalToSuperview()
      make.width.equalToSuperview().multipliedBy(0.5)
    }
    imageView2.snp.makeConstraints { (make) in
      make.top.right.bottom.equalToSuperview()
      make.width.equalToSuperview().multipliedBy(0.5)
    }
  }

  private func buildSubview() {

  }


}
