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
  }
  
  @objc func handleBackBtn() {
    navigationController?.popViewController(animated: true)
  }
  
  @IBAction func resetPasswordBtnTap(_ sender: Any) {
    if emailTextField.text == "" {
      print("빈칸 있음")
    }
    
    let body: Parameters = [
      "email": emailTextField.text!
    ]
    
    AF.request(
      "http://localhost:3000/api-docs/Users/forgotPassword",
      method: .put,
      parameters: body,
      encoding: JSONEncoding.default,
      headers: nil).responseData(completionHandler: { (response) in
      print(response.result)
    })
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
