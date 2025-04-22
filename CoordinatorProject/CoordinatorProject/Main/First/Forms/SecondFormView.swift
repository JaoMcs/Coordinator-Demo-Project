//
//  FirstFormView 2.swift
//  CoordinatorProject
//
//  Created by João Marcos on 22/04/25.
//

import SwiftUI

struct SecondFormView: View {

    @ObservedObject var viewModel: FormViewModel

    var body: some View {
        VStack {
            ZStack {
                Color.teal.opacity(0.3)
                    .ignoresSafeArea()
                VStack {
                    Text("Second Form View")

                    TextField("conta", text: $viewModel.conta)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    TextField("saldo", text: $viewModel.saldo)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    HStack {
                        Button("back") {
                            viewModel.goBackFormView()
                        }
                        Divider().fixedSize()
                        Button("next") {

                        }
                        .disabled(true)
                    }
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
        }
    }
}

#Preview {
    SecondFormView(viewModel: FormViewModel())
}
