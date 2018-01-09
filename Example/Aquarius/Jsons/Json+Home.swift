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

  static let home = [
    "page_id": "home",
    "containers":
      [
        ["ratio": 0.4,
         "type_id": "Images4",
         "index": 0,
         "id": "images_1001",
         "config":
          ["0":
            [
              "w_ratio": 0.2,
              "h_ratio": 0.2,
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
        ],

        ["ratio": 0.3,
         "type_id": "Images2",
         "index": 1,
         "id": "HotGoods_1001",
         "config": ["icon1" : icon,
                    "icon2" : icon,
                    "icon1Ratio": 0.3]
        ],

        ["ratio": 0.5,
         "type_id": "Images2",
         "index": 2,
         "id": "HotGoods_1001",
         "config": ["icon1" : icon,
                    "icon2" : icon,
                    "icon1Ratio": 0.5]
        ],

        ["ratio": 0.7,
         "type_id": "Images2",
         "index": 3,
         "id": "HotGoods_1001",
         "config": ["icon1" : icon,
                    "icon2" : icon,
                    "icon1Ratio": 0.7]
        ]
    ]
    ] as [String : Any]

}
