//
//  AnimationCollectionViewCell.swift
//  CollectionViewAnimation
//
//  Created by Trần Vũ Hưng on 11/29/17.
//  Copyright © 2017 Tran Vu Hung. All rights reserved.
//

import UIKit

class AnimationCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var backButton: UIButton!
  @IBOutlet weak var animationImageView: UIImageView!
  @IBOutlet weak var animaionTextView: UITextView!
  
  var backButtonTapped: (() -> Void)?
  
  func prepareCell(viewModel: AnimationCellModel){
    animationImageView.image = UIImage(named: viewModel.imagePath)
    animaionTextView.isScrollEnabled = false
    backButton.isHidden = true
    addTapEventHandler()
  }
  
  func handleCellSelected(){
    animaionTextView.isScrollEnabled = true
    backButton.isHidden = false
    self.superview?.bringSubview(toFront: self)
  }
  
  private func addTapEventHandler(){
    backButton.addTarget(self, action: #selector(backButtonDidTouch), for: UIControlEvents.touchUpInside)
  }
  
  func backButtonDidTouch(sender: UIGestureRecognizer){
    backButtonTapped?()
  }
  
}
