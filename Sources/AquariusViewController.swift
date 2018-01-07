//
//  AquariusTableViewController.swift
//  AquariusTableViewController
//
//  Created by bigl on 2018/1/5.
//

import UIKit


open class AquariusViewController: UIViewController {

  static var jsonCells = [String: AquariusProtocol.Type]()
  var registCells = [String: AquariusProtocol.Type]()

  var cellItems = [Aquarius.Container]()
  var indexDict = [Int: Aquarius.Container]()

  
  public let tableView = AquariusView(frame: .zero, style: .grouped)

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    
  }

  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override open func viewDidLoad() {
    super.viewDidLoad()
    buildUI()
  }

}


// MARK: - APIs
extension AquariusViewController {

  public func update(containers items: [Aquarius.Container]) {
    cellItems = insert(tableView: tableView,
                       cellItems: cellItems,
                       newItems: items)
    tableView.reloadData()
  }

}


extension AquariusViewController {

  /// 数据排序
  ///
  /// - Parameter jsonItems: 待排序的数据
  /// - Returns: 排序后的数据
  func insert(tableView: AquariusView,
              cellItems: [Aquarius.Container],
              newItems: [Aquarius.Container]) -> [Aquarius.Container] {
    let lawfulItems = regist(tableView: tableView, newItems: newItems)

    lawfulItems.forEach { (item) in
      indexDict[item.index] = item
    }

    let newList = indexDict.sorted { (item1, item2) -> Bool in
      return item2.key > item1.key
      }.map { (item3) -> Aquarius.Container in
        return item3.value
    }

    return newList
  }

  /// 新数据校验
  ///
  /// - Parameters:
  ///   - tableView: tableview 用于新cell注册
  ///   - newItems: 新数据
  /// - Returns:  合法数据
  func regist(tableView: AquariusView, newItems: [Aquarius.Container]) -> [Aquarius.Container] {
    let items = newItems.flatMap({ (item) -> Aquarius.Container? in
      guard let c = getCellProtocol(tableView: tableView, typeId: item.typeId),
        c.verify(dict: item.subDict) else { return nil }
      let item = item
      registCells[item.typeId] = c
      return item
    })
    return items
  }

  /// 新数据校验
  ///
  /// - Parameters:
  ///   - tableView: tableview 用于新cell注册
  ///   - newItems: 新数据
  /// - Returns:  合法数据
  func getCellProtocol(tableView: AquariusView, typeId: String) -> AquariusProtocol.Type? {
    if let c = registCells[typeId] { return c }

    if let c = AquariusViewController.jsonCells[typeId] {
      registCells[typeId] = c
      if let nib = c.nib {
        tableView.register(nib, forCellReuseIdentifier: typeId)
      }else{
        tableView.register(c, forCellReuseIdentifier: typeId)
      }
      return c
    }

    if let c = NSClassFromString(Aquarius.cellPrefix + typeId + Aquarius.cellSuffix) as? AquariusProtocol.Type {
      registCells[typeId] = c
      AquariusViewController.jsonCells[typeId] = c
      if let nib = c.nib {
        tableView.register(nib, forCellReuseIdentifier: typeId)
      }else{
        tableView.register(c, forCellReuseIdentifier: typeId)
      }
      return c
    }
    return nil
  }


}

extension AquariusViewController {

  private func buildUI() {
    view.addSubview(tableView)
    buildLayout()
    buildSubview()
  }

  private func buildLayout() {
    tableView.frame = view.bounds
  }

  private func buildSubview() {
    tableView.dataSource = self
    tableView.delegate = self
    tableView.showsHorizontalScrollIndicator = false
    tableView.showsVerticalScrollIndicator = false
  }
}

extension AquariusViewController: UITableViewDataSource {

  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cellItems.count
  }

  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let item = cellItems[indexPath.item]
    guard let tableView = tableView as? AquariusView,
      let cell = tableView.dequeueReusableCell(withIdentifier: item.typeId, for: indexPath) as? AquariusProtocol else {
        return UITableViewCell()
    }
    cell.dict = item.subDict
    return cell as! UITableViewCell
  }
}

extension AquariusViewController: UITableViewDelegate {

  public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return tableView.bounds.width * cellItems[indexPath.item].ratio
  }

}







