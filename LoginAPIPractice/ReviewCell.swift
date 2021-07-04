//
//  ReviewCell.swift
//  LoginAPIPractice
//
//  Created by 신미지 on 2021/07/05.
//

import UIKit

class ReviewCell: UICollectionViewCell {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var imageBtn: UIButton!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    // initialize what is needed
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    
    self.isUserInteractionEnabled = true
    // initialize what is needed
  }
  
  @IBAction func imageBtnTap(_ sender: Any) {
    print("image tapped!")
  }
}
