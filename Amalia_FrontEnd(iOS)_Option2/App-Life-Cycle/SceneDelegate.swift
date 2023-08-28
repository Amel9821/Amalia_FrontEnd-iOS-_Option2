//
//  SceneDelegate.swift
//  Amalia_FrontEnd(iOS)_Option2
//
//  Created by Amalia . on 24/08/23.
//
import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let vc = CategoryListRouter.createCategoryModule()
        let navVc = UINavigationController(rootViewController: vc)
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navVc
        window?.makeKeyAndVisible()
    }

}

