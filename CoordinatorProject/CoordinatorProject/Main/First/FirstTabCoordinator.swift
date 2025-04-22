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

    var childCoordinators = [Coordinator]()

    let viewModel = FirstTabViewModel()

    override init () {
        rootViewController.navigationBar.prefersLargeTitles = true
        super.init()

        rootViewController.delegate = self
    }

    lazy var firstViewController: FirstViewController = {
        let vc = FirstViewController()
        vc.viewModel = viewModel
        viewModel.showDetailRequested = { [weak self] in
            self?.goToDetail()
        }
        viewModel.actionForm = { [weak self] in
            self?.goFormFluxo()
        }
        viewModel.closeAction = { [weak self] in
            self?.closeViews()
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

    func goFormFluxo() {
        let formsCoordinator = FormsCoordinator()
        formsCoordinator.start()
        self.childCoordinators = [formsCoordinator]
        self.rootViewController.present(formsCoordinator.rootViewController, animated: true, completion: nil)
    }

    func closeViews() {
        rootViewController.popToRootViewController(animated: true)
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
