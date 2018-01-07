//
//  Aquarius.swift
//  Aquarius
//
//  Created by bigl on 2018/1/7.
//

import UIKit

public struct Aquarius {

  public static var cellPrefix = "Aquarius"
  public static var cellSuffix = "Cell"

  public struct Container {
    /// 宽高比
    public var ratio: CGFloat
    /// 类型
    public var typeId: String
    /// 所在位置
    public var index: Int
    /// 唯一标识
    public var id: String
    /// 控件内部描述
    public var subDict: [String: Any]

    public init(ratio: CGFloat,
                typeId: String,
                index: Int,
                id: String,
                subDict: [String: Any]) {
      self.ratio = ratio
      self.typeId = typeId
      self.index = index
      self.id = id
      self.subDict = subDict
    }
  }
}
