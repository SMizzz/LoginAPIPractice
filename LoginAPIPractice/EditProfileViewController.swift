//
//  EditProfileViewController.swift
//  LoginAPIPractice
//
//  Created by 신미지 on 2021/06/30.
//

import UIKit
import Moya
import SwiftyJSON
import Kingfisher


class EditProfileViewController: UIViewController {
  
  @IBOutlet weak var profileImageView: UIImageView!
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
//  var user : User() = {}
//  var user = User
  let picker = UIImagePickerController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTapGRForKeyboardDismissal()
    profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
    profileImageView.contentMode = .scaleAspectFill
    picker.delegate = self
    // Do any additional setup after loading the view.
    
    getData()
  }
  
  private func getData() {
    let token = UserDefaults.standard.string(forKey: "token")!
    print("=================",token)
    AuthNetworkManager.getCurrent(token: token) { [self] (user) in
      print(user)
      profileImageView.kf.setImage(with: URL(string: user.avatar))
      nameTextField.text = user.name
      emailTextField.text = user.email
    }
    
    /*
    let headers: HTTPHeaders = [
      "Authorization": "bearer \(token)",
      "Accept": "application/json"
    ]
    
    AF.request("http://localhost:3000/users/secret", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { [self] (response) in
      print(response.result)
      switch response.result {
      case .success(let data):
        let jsonData = JSON(data)
        profileImageView.kf.setImage(with: URL(string: jsonData["avatar"].string!))
        nameTextField.text = jsonData["name"].string
        emailTextField.text = jsonData["email"].string
        
        return
      case .failure(let error):
        print(error.localizedDescription)
        return
      }
    }
 */
  }
  
  @IBAction func pencilBtnTap(_ sender: Any) {
    let alertVC = UIAlertController(title: "사진 선택", message: "pick!", preferredStyle: .actionSheet)
    let library =  UIAlertAction(title: "사진앨범", style: .default) { (action) in self.openLibrary()
    }
    
    let camera =  UIAlertAction(title: "카메라", style: .default) { (action) in
      self.openCamera()
    }
    
    let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
    
    alertVC.addAction(library)
    alertVC.addAction(camera)
    alertVC.addAction(cancel)
    self.present(alertVC, animated: true, completion: nil)
  }
  
  @IBAction func cancelBtnTap(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }
  
  @IBAction func saveBtnTap(_ sender: Any) {
    print("완료")
  }
  
  func openLibrary() {
    picker.sourceType = .photoLibrary
    self.present(picker, animated: false, completion: nil)
  }

  func openCamera() {
    if(UIImagePickerController.isSourceTypeAvailable(.camera)) {
      picker.sourceType = .camera
      self.present(picker, animated: false, completion: nil)
    } else {
      print("Camera not available")
    }
  }
}

extension EditProfileViewController :
  UIImagePickerControllerDelegate,
  UINavigationControllerDelegate {
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
      profileImageView.image = image
    }
    self.dismiss(animated: true, completion: nil)
  }
}
