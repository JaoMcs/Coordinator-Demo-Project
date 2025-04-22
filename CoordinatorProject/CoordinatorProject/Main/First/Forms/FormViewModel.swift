//
//  FormViewModel.swift
//  CoordinatorProject
//
//  Created by João Marcos on 22/04/25.
//

import Foundation

class FormViewModel: ObservableObject {

    @Published var conta: String = ""
    @Published var saldo: String = ""

    var dados: [String: Any]?

    let isDataCanBeLoaded: Bool = false


    var goToSecoundFormView: (() -> Void) = { }

    var goToThirdFormView: (() -> Void) = { }

    var goBackFormView: (() -> Void) = { }

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

    func haveBackButton() {
        
    }


}
