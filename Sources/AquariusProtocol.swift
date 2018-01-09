//
//  JsonData.swift
//  JsonTableViewCotroller
//
//  Created by linhey on 2018/1/5.
//

import UIKit

public protocol AquariusProtocol: class {
  static func verify(dict: [String: AnyHashable]) -> Bool
  var config: [String: AnyHashable] { set get }
  static var ratio: Double { get }
  static var nib: UINib? { get }
}

public extension AquariusProtocol {
  static public var id: String { return String(describing: Self.self) }
  static public var nib: UINib? { return nil }
}

public protocol AquariusNibProtocol: AquariusProtocol { }

public extension AquariusNibProtocol {
  static public var nib: UINib? {
    print(String(describing: Self.self))
    return UINib(nibName: String(describing: Self.self), bundle: nil)
  }
}
