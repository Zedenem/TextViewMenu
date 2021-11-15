/*! @copyright 2021 Medium */

import UIKit
import LoremSwiftum

class TestTableViewCell: UITableViewCell {
  var textView = TextView()

  override func layoutSubviews() {
    super.layoutSubviews()
    if textView.superview == nil {
      contentView.addSubview(textView)
    }
    textView.frame = contentView.bounds
  }

//  override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
//    print("CELL action to perform: \(action)")
//    return false
//  }
}

class TestTableView: UITableView {
//  override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
//    print("TABLEVIEW action to perform: \(action)")
//    return false
//  }
}

class TextInTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  let tableView = TestTableView(frame: .zero, style: .plain)
  let text = "Some text to put in the view because I need some to test the selection. Some text to put in the view because I need some to test the selection. Some text to put in the view because I need some to test the selection. Some text to put in the view because I need some to test the selection. Some text to put in the view because I need some to test the selection."

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.dataSource = self
    tableView.delegate = self
    tableView.selectionFollowsFocus = false
    tableView.register(TestTableViewCell.self, forCellReuseIdentifier: "Cell")

    tableView.frame = view.bounds
    view.addSubview(tableView)
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TestTableViewCell else {
      fatalError("NOPE")
    }
    cell.textView.text = Lorem.paragraphs(3)
    return cell
  }
//
//  func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
//    return false
//  }
//
//  func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {}
//
//  func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
//    return false
//  }
}

