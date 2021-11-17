/*! @copyright 2021 Medium */

import UIKit

class TextTableViewCell: UITableViewCell {
  var textView = TextView()

  override func layoutSubviews() {
    super.layoutSubviews()
    if textView.superview == nil {
      contentView.addSubview(textView)
    }
    textView.frame = contentView.bounds
  }
}

class TextInTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  let tableView = UITableView(frame: .zero, style: .plain)

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.dataSource = self
    tableView.delegate = self
    tableView.selectionFollowsFocus = false
    tableView.register(TextTableViewCell.self, forCellReuseIdentifier: "Cell")

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
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TextTableViewCell else {
      fatalError("NOPE")
    }
    return cell
  }
}

