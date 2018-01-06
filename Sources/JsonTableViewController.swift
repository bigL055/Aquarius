//
//  JsonTableViewController.swift
//  JsonTableViewCotroller
//
//  Created by bigl on 2018/1/5.
//

import UIKit


open class JsonTableViewController: UIViewController {

  static var jsonCells = [String: JsonCellProtocol.Type]()
  var registCells = [String: JsonCellProtocol.Type]()
  var cellItems = [Container]()
  
  public let tableView = JsonTableView(frame: .zero, style: .grouped)

  public var cellPrefix = "Json"
  public var cellSuffix = "TableViewCell"

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
extension JsonTableViewController {

  public func update(containers items: [Container]) {
    cellItems = insert(tableView: tableView,
                       cellItems: cellItems,
                       newItems: items)
    tableView.reloadData()
  }

}


extension JsonTableViewController {

  /// 数据排序
  ///
  /// - Parameter jsonItems: 待排序的数据
  /// - Returns: 排序后的数据
  func insert(tableView: JsonTableView,
              cellItems: [Container],
              newItems: [Container]) -> [Container] {
    let lawfulItems = regist(tableView: tableView, newItems: newItems)
    return cellItems + lawfulItems
  }

  /// 新数据校验
  ///
  /// - Parameters:
  ///   - tableView: tableview 用于新cell注册
  ///   - newItems: 新数据
  /// - Returns:  合法数据
  func regist(tableView: JsonTableView, newItems: [Container]) -> [Container] {
    let items = newItems.flatMap({ (item) -> Container? in
      guard let c = getCellProtocol(tableView: tableView, typeId: item.typeId),
        c.verify(dict: item.subDict) else { return nil }
      var item = item
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
  func getCellProtocol(tableView: JsonTableView, typeId: String) -> JsonCellProtocol.Type? {
    if let c = registCells[typeId] { return c }

    if let c = JsonTableViewController.jsonCells[typeId] {
      registCells[typeId] = c
      if let nib = c.nib {
        tableView.register(nib, forCellReuseIdentifier: typeId)
      }else{
        tableView.register(c, forCellReuseIdentifier: typeId)
      }
      return c
    }

    if let c = NSClassFromString(cellPrefix + typeId + cellSuffix) as? JsonCellProtocol.Type {
      registCells[typeId] = c
      JsonTableViewController.jsonCells[typeId] = c
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

extension JsonTableViewController {

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

extension JsonTableViewController: UITableViewDataSource {

  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cellItems.count
  }

  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let item = cellItems[indexPath.item]
    guard let tableView = tableView as? JsonTableView,
      let cell = tableView.dequeueReusableCell(withIdentifier: item.typeId, for: indexPath) as? JsonCellProtocol else {
        return UITableViewCell()
    }
    cell.dict = item.subDict
    return cell as! UITableViewCell
  }

}


extension JsonTableViewController: UITableViewDelegate {

  public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     return tableView.bounds.width * cellItems[indexPath.item].ratio
  }

}







