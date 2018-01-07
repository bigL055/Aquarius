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

    (0...10000).forEach { (index) in
    let item = Aquarius.Container(ratio: 0.3,
                         typeId: "Line",
                         index: index % 7,
                         id: index.description,
                         subDict: ["text": index.description])
      list.append(item)
    }


    update(containers: list)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}

