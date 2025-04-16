//
//  OnboardingCoordinator.swift
//  CoordinatorProject
//
//  Created by João Marcos on 15/04/25.
//

import Foundation
import SwiftUI
import Combine

class OnboardingCoordinator: Coordinator {

    var rootViewController = UIViewController()

    // A variavel que vai ser setada pra saber se ja foi visto ou não
    var hasSeenOnboarding: CurrentValueSubject<Bool, Never>

    init(hasSeenOnboarding: CurrentValueSubject<Bool, Never>) {
        self.hasSeenOnboarding = hasSeenOnboarding
    }
    

    func start() {
        let view = OnboardingView { [weak self] in
            self?.hasSeenOnboarding.send(true)
        }
        rootViewController = UIHostingController(rootView: view)
    }
}
