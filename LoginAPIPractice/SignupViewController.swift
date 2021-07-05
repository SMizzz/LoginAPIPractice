//
//  SignupViewController.swift
//  LoginAPIPractice
//
//  Created by 신미지 on 2021/06/28.
//

import UIKit
import SwiftyJSON

class SignupViewController: UIViewController {
  
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      navigationController?.navigationBar.isHidden = false
      navigationController?.navigationBar.barTintColor = .white
        // Do any additional setup after loading the view.
      nameTextField.autocorrectionType = .no
      emailTextField.autocorrectionType = .no
      passwordTextField.autocorrectionType = .no
      setupTapGRForKeyboardDismissal()
    }
  
  @IBAction func signupBtnTap(_ sender: Any) {
    if emailTextField.text == "" && passwordTextField.text == "" {
      print("빈칸 있음")
    }
    
    AuthNetworkManager.getSignup(name: nameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!) { (msg) in
      print(msg)
      ModalVC.AlertVC(title: "회원가입 완료", msg: msg, action: { (_) in
        self.navigationController?.popViewController(animated: true)
      }, view: self)
    }
    
    /*
    provider.request(.signup(name: nameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!)) { (result) in
      switch result {
      case .success(let res):
//        print(res.data)
        let jsonData = JSON(res.data)
        print(jsonData)
        
        ModalVC.AlertVC(title: "회원가입 완료", msg: jsonData["message"].string!, action: { (_) in
          self.navigationController?.popViewController(animated: true)
        }, view: self)
//        do {
//
//        } catch let err {
//
//        }
        return
      case .failure(let err):
        print(err.localizedDescription)
        return
      }
    }
    */
  
    
    /*
    let body: Parameters = [
      "name": nameTextField.text!,
      "email": emailTextField.text!,
      "password": passwordTextField.text!
    ]
    
    AF.request("http://localhost:3000/users/signup", method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseData { (response) in
      switch response.result {
      case .success(let data):
        let jsonData = JSON(data)
        print("++++++++++++++++", jsonData)
        if response.response?.statusCode == 200 {
          let alertVC = UIAlertController(
            title: "회원가입 완료",
            message: jsonData["message"].string,
            preferredStyle: .alert)
          alertVC.addAction(
            UIAlertAction(
              title: "OK",
              style: .default,
              handler: { (_) in
            self.navigationController?.popViewController(animated: true)
          }))
          self.present(alertVC, animated: true, completion: nil)
          return
        } else {
          let alertVC = UIAlertController(
            title: "경고!",
            message: jsonData["errors"].string,
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
        print(error.localizedDescription)
        return
      }
    }
 */
  }


}
