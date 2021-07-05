//
//  SearchBarViewController.swift
//  LoginAPIPractice
//
//  Created by 신미지 on 2021/06/30.
//

import UIKit

class SearchBarViewController: UIViewController {
  
  @IBOutlet weak var profileImageBtn: UIButton!
  @IBOutlet weak var searchBar: UISearchBar!
 
  override func viewDidLoad() {
        super.viewDidLoad()
    setupTapGRForKeyboardDismissal()
    profileImageBtn.layer.cornerRadius = profileImageBtn.frame.height / 2
    profileImageBtn.contentMode = .scaleAspectFill
        // Do any additional setup after loading the view.
   
    }
 
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
