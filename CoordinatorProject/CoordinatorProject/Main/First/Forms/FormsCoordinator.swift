//
//  FormsCoordinator.swift
//  CoordinatorProject
//
//  Created by João Marcos on 22/04/25.
//

import UIKit
import SwiftUI

class FormsCoordinator: NSObject, Coordinator {

    var rootViewController = UINavigationController()

    let viewModel = FormViewModel()

    override init () {
        rootViewController.navigationBar.prefersLargeTitles = true
        super.init()

        rootViewController.delegate = self
    }

    lazy var formViewController = UIViewController()

    func start() {
        rootViewController.modalPresentationStyle = .pageSheet
        viewModel.closeAction = { [weak self] in
            self?.closeViews()
        }
        viewModel.goToSecoundFormView = { [weak self] in
            self?.goToSecondView()
        }
        viewModel.goToThirdFormView = { [weak self] in
            self?.goToThirdView()
        }
        viewModel.goBackFormView = { [weak self] in
            self?.backForm()
            
        }
        let vc = UIHostingController(rootView: FirstFormView(viewModel: viewModel))
        vc.title = "First"
        formViewController = vc
        rootViewController.setViewControllers([vc], animated: false)
    }

    func goToSecondView() {
        let secoundFormViewController = UIHostingController(rootView: SecondFormView(viewModel: viewModel))
        rootViewController.pushViewController(secoundFormViewController, animated: true)
    }

    func goToThirdView() {
        let thirdFormViewController = UIHostingController(rootView: ThirdFormView(viewModel: viewModel))
        rootViewController.pushViewController(thirdFormViewController, animated: true)
    }

    func backForm() {
        rootViewController.popToRootViewController(animated: true)
    }

    func closeViews() {
        self.rootViewController.dismiss(animated: true)
    }
}

extension FormsCoordinator: UINavigationControllerDelegate {
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
