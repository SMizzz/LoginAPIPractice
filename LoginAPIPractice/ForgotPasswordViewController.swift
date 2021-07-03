//
//  ForgotPasswordViewController.swift
//  LoginAPIPractice
//
//  Created by 신미지 on 2021/06/28.
//

import UIKit
import Alamofire
import SwiftyJSON

class ForgotPasswordViewController: UIViewController {
  
  @IBOutlet weak var emailTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBar.isHidden = false
    navigationController?.navigationBar.barTintColor = .white
    navigationController?.navigationItem.backBarButtonItem = UIBarButtonItem(
      image: UIImage(named: "arrow-left"),
      style: .done,
      target: self,
      action: #selector(handleBackBtn))
    // Do any additional setup after loading the view.
    emailTextField.autocorrectionType = .no
    setupTapGRForKeyboardDismissal()
  }
  
  @objc func handleBackBtn() {
    navigationController?.popViewController(animated: true)
  }
  
  @IBAction func resetPasswordBtnTap(_ sender: Any) {
    if emailTextField.text == "" {
      print("빈칸 있음")
    }
//
//    let url = URL(string: "http://localhost:3000/api-docs/Users/forgotPassword")
//
//    var request = URLRequest(url: url!)

//    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
    let body: Parameters = ["email": emailTextField.text!]
//    let header: HTTPHeaders = ["Content-Type": "application/json"]
    
    AF.request("http://localhost:3000/api-docs/Users/forgotPassword", method: .put, parameters: body, encoding: JSONEncoding.default, headers: nil)
      .responseData { (response) in
        switch response.result {
        case .success(let data):
          print(body)
          print("========",JSON(data))
          if response.response?.statusCode == 200 {
            print("status code 200")
            print("data is \(JSON(data))")
            return
          } else {
            print("이메일이 틀렸습니다.")
          }
          
        case .failure(let error):
          print(error.localizedDescription)
        }
      }
  }
  
//    AF.request("http://localhost:3000/api-docs/Users/forgotPassword", method: .put, parameters: body, encoding: JSONEncoding.default, headers: header).responseData { (response) in
//      switch response.result {
//      case .success(let data):
//        let jsonData = JSON(data)
//        let alertVC = UIAlertController(title: "확인!", message: jsonData["message"].string, preferredStyle: .alert)
//        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        self.present(alertVC, animated: true, completion: nil)
//        return
//
//      case .failure(let error):
//        print(error.localizedDescription)
//        return
//      }
//    }
  
//    AF.request(
//      "http://localhost:3000/api-docs/Users/forgotPassword",
//      method: .put,
//      parameters: body,
//      encoding: JSONEncoder.self as! ParameterEncoding,
//      headers: nil).responseData(completionHandler: { (response) in
//        print(response.result)
//
//        switch response.result {
//        case .success(let data):
//          print("data is \(JSON(data))")
//        case .failure(let error):
//        print("실패")
//      }
//      })
}
