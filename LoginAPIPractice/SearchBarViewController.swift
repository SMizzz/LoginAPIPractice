//
//  SearchBarViewController.swift
//  LoginAPIPractice
//
//  Created by 신미지 on 2021/06/30.
//

import UIKit

class SearchBarViewController: UIViewController {

  @IBOutlet weak var searchBar: UISearchBar!
  
  override func viewDidLoad() {
        super.viewDidLoad()
    setupTapGRForKeyboardDismissal()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
  @IBAction func profileBtnTap(_ sender: Any) {
    guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "EditProfileVC") else { return }
    vc.modalPresentationStyle = .fullScreen
    self.present(vc, animated: true, completion: nil)
  }
  
  @IBAction func settingBtnTap(_ sender: Any) {
    let mainSB = UIStoryboard(name: "Main", bundle: nil)
    let logoutVC = mainSB.instantiateViewController(withIdentifier: "LogoutVC")
    logoutVC.modalPresentationStyle = .fullScreen
    self.present(logoutVC, animated: true, completion: nil)
  }
}
