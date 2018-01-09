//
//  ViewController.swift
//  Aquarius
//
//  Created by linhan.bigl055@outlook.com on 01/06/2018.
//  Copyright (c) 2018 linhan.bigl055@outlook.com. All rights reserved.
//

import UIKit
import Aquarius

class ViewController: AquariusViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    var list = [Aquarius.Container]()

    (0...1).forEach { (index) in

      let item = Aquarius.Container(ratio: CGFloat(arc4random_uniform(10)) * 0.1,
                                    typeId: "HotGoods",
                                    index: index,
                                    id: "HotGoods",
                                    subDict: ["icon1" : "http://imgsrc.baidu.com/image/c0%3Dshijue1%2C0%2C0%2C294%2C40/sign=24b696219d0a304e462fa8b9b9a1cdf3/241f95cad1c8a78610bea82b6d09c93d70cf507b.jpg",
                                              "icon2" : "http://imgsrc.baidu.com/image/c0%3Dshijue1%2C0%2C0%2C294%2C40/sign=24b696219d0a304e462fa8b9b9a1cdf3/241f95cad1c8a78610bea82b6d09c93d70cf507b.jpg"])

//    let item = Aquarius.Container(ratio: 0.3,
//                         typeId: "Line",
//                         index: index % 7,
//                         id: index.description,
//                         subDict: ["text": index.description])
      list.append(item)
    }


//    list.append(item)
    update(containers: list)
  }

}

