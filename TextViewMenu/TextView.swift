/*! @copyright 2021 Medium */

import UIKit
import LoremSwiftum

class TextView: UITextView {
  override init(frame: CGRect, textContainer: NSTextContainer?) {
    super.init(frame: frame, textContainer: textContainer)
    linkTextAttributes = [:]
    isEditable = false
    text = Lorem.paragraphs(3)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
    print("TextView action to perform: \(action)")
    return false
  }
}
