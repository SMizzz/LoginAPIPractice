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
    
    let body: Parameters = ["email": emailTextField.text!]
    
    AF.request("http://localhost:3000/api-docs/Users/forgotPassword", method: .put, parameters: body, encoding: JSONEncoding.default, headers: nil).responseData { (response) in
      switch response.result {
      case .success(let data):
        let jsonData = JSON(data)
        let alertVC = UIAlertController(title: "확인!", message: jsonData["message"].string, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
        return
        
      case .failure(let error):
        print(error.localizedDescription)
        return
      }
    }
  
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

}
