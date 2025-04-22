//
//  ThirdFormView.swift
//  CoordinatorProject
//
//  Created by João Marcos on 22/04/25.
//

import SwiftUI

struct ThirdFormView: View {
    @ObservedObject var viewModel: FormViewModel

    var body: some View {
        ZStack {
            Color.blue.opacity(0.3)
                .ignoresSafeArea()
            VStack {
                Text("Third Form View")
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
    ThirdFormView(viewModel: FormViewModel())
}
