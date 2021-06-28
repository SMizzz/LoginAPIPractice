//
//  ViewController.swift
//  LoginAPIPractice
//
//  Created by 신미지 on 2021/06/28.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  var window: UIWindow?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBar.isHidden = true
    // Do any additional setup after loading the view.
  }

  @IBAction func signinBtnTap(_ sender: Any) {
    if emailTextField.text == "" && passwordTextField.text == "" {
      print("빈칸 있음")
    }
    
    print(",,,,")
    let wnd = UIApplication.shared.windows.filter{$0.isKeyWindow}.first
    let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") as! MainViewController
    wnd?.rootViewController = mainVC
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

