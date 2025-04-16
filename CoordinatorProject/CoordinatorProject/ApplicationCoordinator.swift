//
//  ApplicationCoordinator.swift
//  CoordinatorProject
//
//  Created by João Marcos on 15/04/25.
//

import UIKit
import SwiftUI
import Combine

class ApplicationCoordinator: Coordinator {

    var window: UIWindow

    var childCoordinators = [Coordinator]()

    // Apenas o booleano, não tem estado de "erro"
    let hasSeenOnboarding = CurrentValueSubject<Bool, Never>(false)
    var subscription = Set<AnyCancellable>()

    init(window: UIWindow) {
        self.window = window
    }

    func start() {

        setupOnboardingValue()

        // Setando o observador
        // weak self pra precaver de memorie leak
        hasSeenOnboarding
            .removeDuplicates()
            .sink { [weak self] hasSeen in
            if hasSeen {
                let mainCoordinator = MainCoordinator()
                mainCoordinator.start()
                self?.childCoordinators = [mainCoordinator]
                self?.window.rootViewController = mainCoordinator.rootViewController
            } else if let hasSeenOnboarding = self?.hasSeenOnboarding {
                let onboardingCoordinator = OnboardingCoordinator(hasSeenOnboarding: hasSeenOnboarding)
                onboardingCoordinator.start()
                self?.childCoordinators = [onboardingCoordinator]
                self?.window.rootViewController = onboardingCoordinator.rootViewController
            }

        }
        .store(in: &subscription)

    }

    func setupOnboardingValue() {
        // Storing and loading of state/data

        let key = "hasSeenOnboarding"
        let value = UserDefaults.standard.bool(forKey: key) // Default is false
        hasSeenOnboarding.send(value)

        hasSeenOnboarding
            .filter { $0 }
            .sink { (value) in
            UserDefaults.standard.set(true, forKey: key)
        }
        .store(in: &subscription)
    }

}
