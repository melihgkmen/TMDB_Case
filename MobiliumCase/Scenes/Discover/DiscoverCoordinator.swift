//
//  DiscoverCoordinator.swift
//  TMDB_Case
//
//  Created by Melih Gökmen on 6.03.2022.
//

/*
import UIKit
import Foundation

final class DiscoverCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    private let discoverViewController = DiscoverCoordinator.instantiate()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        let discoverViewModel = DiscoverViewModel()
        discoverViewModel.coordinator = self
        discoverViewController.viewModel = discoverViewModel
        navigationController.setViewControllers([discoverViewController], animated: false)
    }
    
    func startDetail(data: Movie) {
        let detailCoordinator = DetailCoordinator(data: data, navigationController: navigationController)
        detailCoordinator.parentCoordinator = self
        childCoordinators.append(detailCoordinator)
        detailCoordinator.start()
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index,coordinator) in childCoordinators.enumerated() {
            if child === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    
}
*/

