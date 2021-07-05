//
//  ViewController.swift
//  LoginAPIPractice
//
//  Created by 신미지 on 2021/06/28.
//

import UIKit
import Alamofire
import SwiftyJSON
import FBSDKLoginKit

class ViewController: UIViewController {
  
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  var window: UIWindow?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBar.isHidden = true
    // Do any additional setup after loading the view.
    emailTextField.autocorrectionType = .no
    passwordTextField.autocorrectionType = .no
    setupTapGRForKeyboardDismissal()
    print(UserDefaults.standard.string(forKey: "token"))
  }
  
  @IBAction func signinBtnTap(_ sender: Any) {
    if emailTextField.text == "" && passwordTextField.text == "" {
      print("빈칸 있음")
    }
    
    AuthNetworkManager.getLogin(email: emailTextField.text!, password: passwordTextField.text!) { (token) in
      print(token)
      UserDefaults.standard.setValue(token, forKey: "token")
      ModalVC.AlertVC(title: "로그인", msg: "완료", action: { (_) in
        let wnd = UIApplication.shared.windows.filter{$0.isKeyWindow}.first
        let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainVC")
        wnd?.rootViewController = mainVC
      }, view: self)
    }
    
    /*
    let body: Parameters = [
      "email": emailTextField.text!,
      "password": passwordTextField.text!
    ] 
    
    AF.request(
      "http://localhost:3000/users/login",
      method: .post,
      parameters: body,
      encoding: JSONEncoding.default,
      headers: nil).responseData { (response) in
        switch response.result {
        case .success(let data):
          let jsonData = JSON(data)
//          print("++++++++++", jsonData)
          if response.response?.statusCode == 200 {
//            print("성공")
            //1. token 저장
            let token = jsonData["token"].string!
            UserDefaults.standard.set(token, forKey: "token")
            
            let alertVC = UIAlertController(
              title: "🎉",
              message: "로그인 완료",
              preferredStyle: .alert)
            alertVC.addAction(
              UIAlertAction(
                title: "OK",
                style: .default, handler: { (_) in
                  let wnd = UIApplication.shared.windows.filter{$0.isKeyWindow}.first
                  let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainVC")
                  wnd?.rootViewController = mainVC
                }))
            self.present(alertVC, animated: true, completion: nil)
            return
          } else {
//            print("------------",data)
            let jsonData = JSON(data)
            print("============", jsonData)
            let alertVC = UIAlertController(
              title: "경고!",
              message: jsonData["message"].string,
              preferredStyle: .alert)
            alertVC.addAction(
              UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil))
            self.present(alertVC, animated: true, completion: nil)
            return
          }
        case .failure(let error):
          print("*****************", error)
          return
        }
      }
 */
  }
  
  
  @IBAction func signupBtnTap(_ sender: Any) {
    let mainSB = UIStoryboard(name: "Main", bundle: nil)
    let signupVC = mainSB.instantiateViewController(withIdentifier: "signupVC")
    
    // 화면 이동 코드
    navigationController?.pushViewController(signupVC, animated: true)
  }
  
  @IBAction func forgotPasswordBtnTap(_ sender: Any) {
    let mainSB = UIStoryboard(name: "Main", bundle: nil)
    let forgotPwVC = mainSB.instantiateViewController(withIdentifier: "forgotPasswordVC")
    navigationController?.pushViewController(forgotPwVC, animated: true)
  }
  
  @IBAction func facebookBtnTap(_ sender: Any) {
    print("facebook button Tap")
    let fbLoginManager = LoginManager()
    fbLoginManager.logIn(permissions: ["public_profile", "email"], from: self) { (result, error) in
      if error != nil {
        print(error?.localizedDescription)
        return
      }
      print((AccessToken.current?.tokenString)!)
//      print(result?.authenticationToken)
    }
  }
  
}

