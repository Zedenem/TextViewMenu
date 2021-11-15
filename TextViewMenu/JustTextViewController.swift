/*! @copyright 2021 Medium */

import UIKit
import LoremSwiftum

class JustTextViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    let textView = TextView(frame: view.bounds, textContainer: nil)
    view.addSubview(textView)
    textView.isEditable = false;
    textView.text = Lorem.paragraphs(3)
  }
}

