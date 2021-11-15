/*! @copyright 2021 Medium */

import UIKit
import LoremSwiftum

class TestCell: UICollectionViewCell {
  var textView = TextView()

  override func layoutSubviews() {
    super.layoutSubviews()
    if textView.superview == nil {
      contentView.addSubview(textView)
    }
    textView.frame = contentView.bounds
  }

  override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
    print("CELL action to perform: \(action)")
    return false
  }
}

class TestCollectionView: UICollectionView {
  override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
    print("COLLECTIONVIEW action to perform: \(action)")
    return false
  }
}

class TextInCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  let collectionView = TestCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
  let text = "Some text to put in the view because I need some to test the selection. Some text to put in the view because I need some to test the selection. Some text to put in the view because I need some to test the selection. Some text to put in the view because I need some to test the selection. Some text to put in the view because I need some to test the selection."

  override func viewDidLoad() {
    super.viewDidLoad()

    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.selectionFollowsFocus = false
    if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
      flowLayout.minimumLineSpacing = 10
      flowLayout.minimumInteritemSpacing = 10
    }
    collectionView.register(TestCell.self, forCellWithReuseIdentifier: "Cell")

    collectionView.frame = view.bounds
    view.addSubview(collectionView)
  }

  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? TestCell else {
      fatalError("NOPE")
    }
    cell.textView.text = Lorem.paragraphs(3)
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 400, height: 100)
  }

  func collectionView(_ collectionView: UICollectionView,
              canPerformAction action: Selector,
                     forItemAt indexPath: IndexPath,
                      withSender sender: Any?) -> Bool {
    return false
  }

  func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {}

  func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
    return false
  }

  func collectionView(_ collectionView: UICollectionView, willDisplayContextMenu configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionAnimating?) {
    print("yolo")
  }

  func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
    return false
  }
}

