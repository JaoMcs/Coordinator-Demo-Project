//
//  FirstFormView.swift
//  CoordinatorProject
//
//  Created by João Marcos on 17/04/25.
//

import SwiftUI

struct FirstFormView: View {

    @ObservedObject var viewModel: FormViewModel

    var body: some View {
        VStack {
            ZStack {
                Color.green.opacity(0.3)
                    .ignoresSafeArea()
                VStack {
                    Text("First Form View")

                    TextField("conta", text: $viewModel.conta)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    TextField("saldo", text: $viewModel.saldo)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    HStack {
                        Button("back") {

                        }
                        .disabled(true)
                        Divider().fixedSize()
                        Button("next") {
                            viewModel.nextViewisRequested()
                        }
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
    FirstFormView(viewModel: FormViewModel())
}
