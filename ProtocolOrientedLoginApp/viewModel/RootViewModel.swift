//
//  RootViewModel.swift
//  ProtocolOrientedLoginApp
//
//  Created by Uraz Alkış on 30.04.2023.
//

import Foundation

class RootViewModel{
    private let loginStorageService : LoginStorageService
    weak var output : RootViewModelOutput?

    init(loginStorageService: LoginStorageService, output: RootViewModelOutput? = nil) {
        self.loginStorageService = loginStorageService

    }
    func checkLogin(){
        if let accessToken = loginStorageService.getUserAccessToken(),!accessToken.isEmpty{
            output?.showMainApp()
        }
        else{
            output?.showLogin()
        }
    }
}
