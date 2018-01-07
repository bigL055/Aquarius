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
    let container1 = Aquarius.Container(ratio: 0.3,
                                       typeId: "Line",
                                       index: 0,
                                       id: "5566",
                                       subDict: ["text": "label1"])

    let container2 = Aquarius.Container(ratio: 0.3,
                                       typeId: "Line",
                                       index: 0,
                                       id: "5566",
                                       subDict: ["text": "label2"])

    update(containers: [container1,container2])
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}

