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
    justTextVC.tabBarItem = UITabBarItem(title: "Just Text", image: UIImage(systemName: "paperplane"), tag: 0)

    let textInCollectionVC = TextInCollectionViewController()
    textInCollectionVC.tabBarItem = UITabBarItem(title: "Collection View", image: UIImage(systemName: "paperplane"), tag: 0)

    let textInTableVC = TextInTableViewController()
    textInTableVC.tabBarItem = UITabBarItem(title: "Table View", image: UIImage(systemName: "paperplane"), tag: 0)

    tabBarController.viewControllers = [justTextVC, textInCollectionVC, textInTableVC]
    window?.rootViewController = tabBarController
    window?.makeKeyAndVisible()
  }
}

