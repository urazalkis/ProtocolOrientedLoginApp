//
//  ViewController.swift
//  ProtocolOrientedLoginApp
//
//  Created by Uraz Alkış on 29.04.2023.
//

import UIKit

class RootViewController: UIViewController,RootViewModelOutput {
    private let viewModel : RootViewModel
    func showLogin() {
        let loginViewController = LoginViewController()
        navigationController?.present(loginViewController, animated: true)
       
    }
    
    func showMainApp() {
        let mainViewController = MainViewController()
        navigationController?.present(mainViewController, animated: true)
    }

    init(viewModel: RootViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.output = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .yellow
        viewModel.checkLogin()
    }


}

