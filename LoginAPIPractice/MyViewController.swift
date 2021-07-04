//
//  MyViewController.swift
//  LoginAPIPractice
//
//  Created by 신미지 on 2021/06/30.
//

import UIKit

class MyViewController: UIViewController {
  
  @IBOutlet weak var reviewCollectionView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTapGRForKeyboardDismissal()
    configureCollectionView()
    // Do any additional setup after loading the view.
  }
  
  private func configureCollectionView() {
    reviewCollectionView.delegate = self
    reviewCollectionView.dataSource = self
    reviewCollectionView.register(ReviewCell.self, forCellWithReuseIdentifier: "cell")
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

extension MyViewController:
  UICollectionViewDelegate,
  UICollectionViewDelegateFlowLayout,
  UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 4
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = reviewCollectionView.dequeueReusableCell(withReuseIdentifier: "ReviewCell", for: indexPath) as? ReviewCell else { return UICollectionViewCell()}
    
    cell.titleLabel.text = "해리포터와 불사조 기사단"
    cell.imageBtn.setImage(UIImage(named: "harrypotter"), for: .normal)
    return cell
  }
}
