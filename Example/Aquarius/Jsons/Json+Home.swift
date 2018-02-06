//
//  Json+Home.swift
//  Aquarius_Example
//
//  Created by bigl on 2018/1/9.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit

extension Json {
  static let icon = "http://imgsrc.baidu.com/image/c0%3Dshijue1%2C0%2C0%2C294%2C40/sign=24b696219d0a304e462fa8b9b9a1cdf3/241f95cad1c8a78610bea82b6d09c93d70cf507b.jpg"


  static func cycleScroll() -> [String: AnyHashable] {
    return ["ratio": 0.4,
            "type_id": "CycleScroll",
            "id": "banner",
            "config": [
              "0": [
                "icon": icon,
                "title": "一",
                "routable": "aquarius://aquarius/vc?id=banner4_0"
              ],
              "2": [
                "icon": icon,
                "title": "一",
                "routable": "aquarius://aquarius/vc?id=banner4_1"
              ],
              "3": [
                "icon": icon,
                "title": "一",
                "routable": "aquarius://aquarius/vc?id=banner4_2"
              ]
      ]
    ]
  }

  static func image4(x: Double,y: Double) -> [String: AnyHashable] {
    return ["ratio": 0.4,
            "type_id": "Images4",
            "id": "images_1001",
            "config":
              [
                "center_x": x,
                "center_y": y,
                "0":
                  [
                    "icon": icon,
                    "title": "一",
                    "routable": "aquarius://aquarius/vc?id=Images4_0"
                ],
                "1": [
                  "icon": icon,
                  "title": "二",
                  "routable": "aquarius://aquarius/vc?id=Images4_1"
                ],
                "2": [
                  "icon": icon,
                  "title": "三",
                  "routable": "aquarius://aquarius/vc?id=Images4_2"
                ],
                "3": [
                  "icon": icon,
                  "title": "四",
                  "routable": "aquarius://aquarius/vc?id=Images4_3"
                ]
      ]
    ]
  }

  static func image2(ratio: Double) -> [String: AnyHashable] {
    return ["ratio": ratio,
            "type_id": "Images2",
            "id": "HotGoods_1001",
            "config": ["icon1" : icon,
                       "icon2" : icon,
                       "icon1Ratio": ratio]
    ]
  }

  static var index = 0
  static func containers(append: [String: AnyHashable]) -> [String: AnyHashable] {
    var append = append
    append["index"] = index
    index += 1
    return append
  }


  static let home = [
    "page_id": "home",
    "containers":
      [ containers(append: cycleScroll()),
        containers(append: image4(x: 0.1, y: 0.9)),
        containers(append: image4(x: 0.2, y: 0.8)),
        containers(append: image4(x: 0.3, y: 0.7)),
        containers(append: image4(x: 0.4, y: 0.6)),
        containers(append: image4(x: 0.5, y: 0.5)),
        containers(append: image4(x: 0.6, y: 0.4)),
        containers(append: image4(x: 0.7, y: 0.3)),
        containers(append: image4(x: 0.8, y: 0.2)),
        containers(append: image4(x: 0.9, y: 0.1)),
        containers(append: image2(ratio: 0.1)),
        containers(append: image2(ratio: 0.2)),
        containers(append: image2(ratio: 0.3)),
        containers(append: image2(ratio: 0.4)),
        containers(append: image2(ratio: 0.5)),
        containers(append: image2(ratio: 0.6)),
        containers(append: image2(ratio: 0.7)),
         containers(append: image2(ratio: 0.8)),
         containers(append: image2(ratio: 0.9))
    ]
    ] as [String : Any]
  
}
