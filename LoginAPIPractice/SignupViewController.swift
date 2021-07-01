//
//  SignupViewController.swift
//  LoginAPIPractice
//
//  Created by 신미지 on 2021/06/28.
//

import UIKit
import Alamofire
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
  }
  
  /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
