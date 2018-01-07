//
//  JsonData.swift
//  JsonTableViewCotroller
//
//  Created by bigl on 2018/1/5.
//

import UIKit

public protocol AquariusProtocol: class {
  static func verify(dict: [String: Any]) -> Bool
  var dict: [String: Any] { set get }
  static var nib: UINib? { get }
}

public extension AquariusProtocol {
  static public var id: String { return String(describing: Self.self) }
  static public var nib: UINib? { return nil }
}

public protocol JsonNibProtocol: AquariusProtocol { }

public extension JsonNibProtocol {
  static public var nib: UINib? {
    return UINib(nibName: String(describing: Self.self), bundle: nil)
  }
}
