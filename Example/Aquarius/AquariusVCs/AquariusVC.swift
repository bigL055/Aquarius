//
//  AquariusViewController.swift
//  Aquarius_Example
//
//  Created by bigl on 2018/1/9.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import Aquarius
import AnyFormatProtocol

class AquariusVC: AquariusViewController,AnyFormatProtocol {


  var id = ""

  init(id: String) {
    super.init(nibName: nil, bundle: nil)
    title = id
    self.id = id
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    if let containers = Json.home["containers"] as? [[String:Any]] {
      let list = containers.map({ (item) -> Aquarius.Container in
        print(item)
        return Aquarius.Container(ratio: format(item["ratio"]),
                                  typeId: format(item["type_id"]),
                                  index: format(item["index"]),
                                  id: format(item["id"]),
                                  config: format(item["config"]))
      })

      update(containers: list)
    }



  }

}
