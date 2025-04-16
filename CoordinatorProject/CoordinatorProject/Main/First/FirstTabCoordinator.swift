//
//  FirstTabCoordinator.swift
//  CoordinatorProject
//
//  Created by João Marcos on 16/04/25.
//

import Foundation
import UIKit
import SwiftUI

class FirstTabCoordinator: NSObject, Coordinator {

    var rootViewController = UINavigationController()

    let viewModel = FirstTabViewModel()

    override init () {
        rootViewController.navigationBar.prefersLargeTitles = true
        super.init()

        rootViewController.delegate = self
    }

    lazy var firstViewController: FirstViewController = {
        let vc = FirstViewController()
        vc.viewModel = viewModel
        vc.showDetailRequested = { [weak self] in
            self?.goToDetail()
        }
        vc.title = "First"
        return vc
    }()

    func start() {
        rootViewController.setViewControllers([firstViewController], animated: false)
    }

    func goToDetail() {
        let detailViewController = UIHostingController(rootView: FirstDetailView(viewModel: viewModel))
        rootViewController.pushViewController(detailViewController, animated: true)
    }
}

extension FirstTabCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              willShow viewController: UIViewController,
                              animated: Bool) {
        if viewController as? UIHostingController<FirstDetailView> != nil{
            print("Datail will be shown")
        } else if viewController as? FirstViewController != nil {
            print("first will be shown")
        }
    }

}
