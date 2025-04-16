//
//  FirstDetailView.swift
//  CoordinatorProject
//
//  Created by João Marcos on 16/04/25.
//

import SwiftUI

struct FirstDetailView: View {

    @ObservedObject var viewModel: FirstTabViewModel

    var body: some View {
        VStack {
            Text("First Detail")

            TextField("Name", text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("email", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

#Preview {
    FirstDetailView(viewModel: FirstTabViewModel())
}
