//
//  LoginStorageServiceIml.swift
//  ProtocolOrientedLoginApp
//
//  Created by Uraz Alkış on 30.04.2023.
//

import Foundation

class LoginStorageServiceImpl : LoginStorageService{
    private let storage = UserDefaults.standard
    var userAccessTokenKey: String {
        return "ACCESS_TOKEN"
    }
    
    func setUserAccess(token: String) {
        storage.set(token, forKey: userAccessTokenKey)
    }
    
    func getUserAccessToken() -> String? {
        storage.string(forKey: userAccessTokenKey)
    }
    
    
}
