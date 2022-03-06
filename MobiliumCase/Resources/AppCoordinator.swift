//
//  AppCoordinator.swift
//  MobiliumCase
//
//  Created by Melih Gökmen on 6.03.2022.
//

import UIKit
import Foundation

final class AppCoordinator: Coordinator {
    private(set) var childCoordinators = [Coordinator]()
   
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        let characterListCoordinator = CharacterListCoordinator(navigationController: navigationController)
        childCoordinators.append(characterListCoordinator)
        characterListCoordinator.start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
