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
            ZStack {
                Color.gray.opacity(0.3)
                    .ignoresSafeArea()
                VStack {
                    Text("Cadastro View")

                    TextField("Name", text: $viewModel.name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    TextField("email", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    viewModel.closeAction()
                } label: {
                    Image(systemName: "xmark")
                }
            }

            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    viewModel.actionForm()
                }) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    FirstDetailView(viewModel: FirstTabViewModel())
}
