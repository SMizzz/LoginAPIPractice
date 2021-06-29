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
  }
  
  @IBAction func signinBtnTap(_ sender: Any) {
    if emailTextField.text == "" && passwordTextField.text == "" {
      print("빈칸 있음")
    }
    
    let body: Parameters = [
      "email": emailTextField.text,
      "password": passwordTextField.text
    ]
    
    //
    let header: HTTPHeaders = [
      .authorization(
        username: emailTextField.text!,
        password: passwordTextField.text!),
      .accept("application/json")
    ]
    
    AF.request("http://localhost:3000/users/login", method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseData(completionHandler: { (response) in
      switch response.result {
      
      case .success(let data):
        do {
          //          guard let responseData = response.result else { return }
          print("response data \(data)")
          if response.response?.statusCode == 200 {
            print("성공")
            let alertVC = UIAlertController(title: "🎉", message: "로그인 완료", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .default,handler: { (_) in
              let wnd = UIApplication.shared.windows.filter{$0.isKeyWindow}.first
              let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") as! MainViewController
              wnd?.rootViewController = mainVC
            }))
            self.present(alertVC, animated: true, completion: nil)
            return
          } else {
            print("Please try again")
            return
          }
        } catch let error {
          print(error.localizedDescription)
          print("Please try again")
          return
        }
      case .failure(let error):
        print(error)
        return
      }
    })
    
    
    //    { (response) in
    //
    //      switch response.result {
    //      case .success(let data):
    //        print("성공")
    //        let jsonData = JSON(data)
    //        guard let dictionaries = try? jsonData()
    //        print("data is \(data)")
    //        let jsonData = JSON(data)
    //        print(jsonData)
    //        let wnd = UIApplication.shared.windows.filter{$0.isKeyWindow}.first
    //        let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") as! MainViewController
    //        wnd?.rootViewController = mainVC
    //        return
    //      case .failure(let error):
    //        print("실패")
    //        print(error.localizedDescription)
    //        return
    //      }
    //    }
    //
    //    print(",,,,")
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

