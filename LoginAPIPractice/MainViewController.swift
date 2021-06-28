//
//  MainViewController.swift
//  LoginAPIPractice
//
//  Created by 신미지 on 2021/06/28.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  @IBAction func logoutBtnTap(_ sender: Any) {
    let alertVC = UIAlertController(title: "로그아웃", message: "정말 로그아웃하시겠습니까", preferredStyle: .actionSheet)
    
    alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
      let wnd = UIApplication.shared.windows.filter{$0.isKeyWindow}.first
      let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC")
      wnd?.rootViewController = loginVC
      
    }))
    
    alertVC.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    
    present(alertVC, animated: true, completion: nil)
    
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
