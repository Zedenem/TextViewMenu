/*! @copyright 2021 Medium */

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?


  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }

    window = UIWindow(frame: UIScreen.main.bounds)
    window?.windowScene = windowScene
    let tabBarController = UITabBarController()

    let justTextVC = JustTextViewController()
    justTextVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)

    let textInCollectionVC = TextInCollectionViewController()
    textInCollectionVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)

    let textInTableVC = TextInTableViewController()
    textInTableVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)

    tabBarController.viewControllers = [justTextVC, textInCollectionVC, textInTableVC]
    window?.rootViewController = tabBarController
    window?.makeKeyAndVisible()
  }
}

