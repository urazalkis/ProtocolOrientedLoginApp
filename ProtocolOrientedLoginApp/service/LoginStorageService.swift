//
//  StorageService.swift
//  ProtocolOrientedLoginApp
//
//  Created by Uraz Alkış on 30.04.2023.
//

import Foundation

protocol LoginStorageService {
    var userAccessTokenKey : String {get}
    func setUserAccess(token:String)
    func getUserAccessToken() -> String?
}
