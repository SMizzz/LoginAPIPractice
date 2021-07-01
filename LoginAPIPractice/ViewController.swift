//
//  ViewController.swift
//  LoginAPIPractice
//
//  Created by 신미지 on 2021/06/28.
//

import UIKit
import Alamofire
import SwiftyJSON

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
  }
  
  @IBAction func signinBtnTap(_ sender: Any) {
    if emailTextField.text == "" && passwordTextField.text == "" {
      print("빈칸 있음")
    }
    
    let body: Parameters = [
      "email": emailTextField.text,
      "password": passwordTextField.text
    ]
    
    let header: HTTPHeaders = [
      .authorization(
        username: emailTextField.text!,
        password: passwordTextField.text!),
      .accept("application/json")
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
          do {
            if response.response?.statusCode == 200 {
              print("성공")
              print(jsonData)
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
              print("Please try again", jsonData)
              print(jsonData["message"])
              let alertVC = UIAlertController(
                title: "확인!",
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
          } catch let error{
            print("error \(error)")
          }
        case .failure(let error):
          print(error.localizedDescription)
          return
        }
      }
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
}

