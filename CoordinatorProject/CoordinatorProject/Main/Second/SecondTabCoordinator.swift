//
//  SecondTabCoordinator.swift
//  CoordinatorProject
//
//  Created by João Marcos on 16/04/25.
//

import Foundation
import UIKit

class SecondTabCoordinator: Coordinator {

    var rootViewController = UINavigationController()

    lazy var secondViewController: SecondViewController = {
        let vc = SecondViewController()
        vc.title = "Second"
        return vc
    }()

    func start() {
        rootViewController.setViewControllers([secondViewController], animated: false)
    }
}
