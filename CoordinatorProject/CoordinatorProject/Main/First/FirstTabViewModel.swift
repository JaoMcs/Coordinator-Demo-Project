//
//  FirstTabViewModel.swift
//  CoordinatorProject
//
//  Created by João Marcos on 16/04/25.
//

import Foundation

class FirstTabViewModel: ObservableObject {

    @Published var name: String = ""
    @Published var email: String = ""

    @Published var conta: String = ""
    @Published var saldo: String = ""

    var dados: [String: Any]?

    let isDataCanBeLoaded: Bool = false


    var actionForm: (() -> Void) = { }

    var goToSecoundFormView: (() -> Void) = { }

    var goToThirdFormView: (() -> Void) = { }

    var showDetailRequested: (() -> Void) = { }

    var closeAction: (() -> Void) = { }


    func requestData() {
        if isDataCanBeLoaded {
            dados = ["nome": "João", "email": "joao@email.com"]
        } else {
            dados = nil
        }
    }

    func nextViewisRequested() {
        requestData()
        if dados != nil {
            goToSecoundFormView()
        } else {
            goToThirdFormView()
        }
    }


}
