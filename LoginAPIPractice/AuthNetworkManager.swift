//
//  NetworkManager.swift
//  LoginAPIPractice
//
//  Created by 신미지 on 2021/07/05.
//

import Moya
import SwiftyJSON

//protocol AuthNetwork {
//  associatedtype T: TargetType
//  var provider: MoyaProvider<T> { get }
//}



class AuthNetworkManager {
  static let provider = MoyaProvider<AuthAPI>()
  static func getSignup(
    name: String,
    email: String,
    password: String,
    completion: @escaping(String) -> ()) {
    provider.request(.signup(name: name, email: email, password: password)) { (result) in
      switch result {
      case .success(let res):
        do {
          print(res.data)
          let jsonData = JSON(res.data)
          completion(jsonData["message"].string!)
        } catch let err {
          print(err)
        }
      case .failure(let error):
        print(error.localizedDescription)
        return
      }
    }
  }
  
  static func getLogin(email: String, password: String, completion: @escaping(String) -> ()) {
    provider.request(.login(email: email, password: password)) { (result) in
      switch result {
      case .success(let res):
        do {
          let jsonData = JSON(res.data)
          completion(jsonData["token"].string!)
        } catch let err {
          print(err.localizedDescription)
        }
      case .failure(let err):
        print(err.localizedDescription)
        return
      }
    }
  }
  
  static func getCurrent(token: String, completion: @escaping(User) -> ()) {
    provider.request(.current(token: token)) { (result) in
      switch result {
      case .success(let res):
        do {
          let userData = try JSONDecoder().decode(User.self, from: res.data)
          completion(userData)
        } catch let error {
          print(error)
        }
      case .failure(let err):
        print(err.localizedDescription)
        return
      }
    }
  }
}
