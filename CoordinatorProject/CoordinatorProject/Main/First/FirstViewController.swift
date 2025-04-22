//
//  FirstViewController.swift
//  CoordinatorProject
//
//  Created by João Marcos on 16/04/25.
//

import UIKit
import Combine

class FirstViewController: UIViewController {

    var infoLabel: UILabel?
    var viewModel: FirstTabViewModel!

    var subscription = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupInfoLabel()
        setupDetailButton()
    }

    override func viewWillAppear(_ animated: Bool) {
        updateInfoLabel()
    }

    func setupDetailButton() {
    let button = UIButton(frame: CGRect(x: 100,
                                        y: 500,
                                        width: 200,
                                        height: 60))

    button.setTitleColor(.systemBlue,  for: .normal)

    button.setTitle("Go to Detail", for: .normal)

    button.addTarget (self,
                      action: #selector(buttonAction),
                      for: .touchUpInside)

    self.view.addSubview(button)
}

    func setupInfoLabel() {
        let infoLabel = UILabel(frame: CGRect(x: 100, y: 300, width: 300, height: 60))
        self.view.addSubview(infoLabel)
        self.infoLabel = infoLabel


        viewModel.$name.combineLatest(viewModel.$email)
            .sink { [weak self] (name, email) in
                if name.count + email.count > 0 {
                    self?.infoLabel?.text = "\(name) with email \(email)"
                } else {
                    self?.infoLabel?.text = "No data yet"
                }
            }
    }

    func updateInfoLabel() {
        self.infoLabel?.text = "\(viewModel.name) with email \(viewModel.email)"
    }

    @objc
    func buttonAction() {
        viewModel.showDetailRequested()
    }

}
