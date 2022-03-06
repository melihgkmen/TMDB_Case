//
//  DetailCoordinator.swift
//  TMDB_Case
//
//  Created by Melih Gökmen on 6.03.2022.
//

/*
import Foundation
import UIKit

final class DetailCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    var data: Movie?
    var parentCoordinator: DiscoverCoordinator?
    
    init(data: Movie, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.data = data
    }

    func start() {
        navigationController.delegate = self
        let detailVC = DetailViewController.instantiate()
        let detailViewModel = DetailViewModel(movie: data!)
        detailViewModel.coordinator = self
        detailVC.viewModel = detailViewModel
        navigationController.pushViewController(detailVC, animated: true)
    }
    
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        if navigationController.viewControllers.contains(fromViewController) {
            return
        } else {
            parentCoordinator?.childDidFinish(self)
        }
    }
    
    
}
*/
