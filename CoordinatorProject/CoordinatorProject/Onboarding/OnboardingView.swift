//
//  OnboardingCoordinatorView.swift
//  CoordinatorProject
//
//  Created by João Marcos on 15/04/25.
//

import SwiftUI

struct OnboardingView: View {

    var doneRequested: (() -> Void)

    var body: some View {
        TabView {
            ScaledImageView(name: "capuchino_assassino")
                .tag(0)
            ScaledImageView(name: "tralalelo_tralala")
                .tag(1)
            ScaledImageView(name: "bombardiro_crocodillo")
                .tag(2)
            ScaledImageView(name: "tung_tung_tung_sahur")
                .tag(3)
            Button("Done") {
                doneRequested()
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .background(.black)
    }
}

#Preview {
    OnboardingView(doneRequested: {
        print("print")
    })
}

struct ScaledImageView: View {
    let name: String
    var body: some View {
        Image(name)
            .resizable()
            .scaledToFit()
    }
}
