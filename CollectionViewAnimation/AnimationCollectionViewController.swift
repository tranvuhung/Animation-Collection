//
//  AnimationCollectionViewController.swift
//  CollectionViewAnimation
//
//  Created by Trần Vũ Hưng on 11/29/17.
//  Copyright © 2017 Tran Vu Hung. All rights reserved.
//

import Foundation
import UIKit

extension Array {
  func safeIndex(i: Int) -> Element? {
    return i < self.count && i >= 0 ? self[i] : nil
  }
}

struct Storyboad {
  static let CellIdentifier = "AnimationCollectionViewCell"
  static let NibName = "AnimationCollectionViewCell"
}

class AnimationCollectionViewController: UICollectionViewController {
  @IBOutlet weak var animationCollectionView: UICollectionView!
  
  var imageCollection: AnimationImageCollection?
  
  override func viewDidLoad() {
    imageCollection = AnimationImageCollection()
    
    let cellNib = UINib(nibName: Storyboad.NibName, bundle: nil)
    animationCollectionView.register(cellNib, forCellWithReuseIdentifier: Storyboad.CellIdentifier)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    collectionView?.reloadData()
  }
  
  //MARK: - CollectionView DataSource
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return imageCollection?.images.count ?? 0
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboad.CellIdentifier, for: indexPath) as? AnimationCollectionViewCell, let viewModel = imageCollection?.images.safeIndex(i: indexPath.row) else {
      return UICollectionViewCell()
    }
    cell.prepareCell(viewModel: viewModel)
    return cell
  }
  
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let cell = collectionView.cellForItem(at: indexPath) as? AnimationCollectionViewCell else {
      return
    }
    
    handleAnimationCellSelected(collectionView: collectionView, cell: cell)
  }
  
  private func handleAnimationCellSelected(collectionView: UICollectionView, cell: AnimationCollectionViewCell){
    cell.handleCellSelected()
    view.layoutIfNeeded()
    cell.backButtonTapped = backButtonDidTouch
    
    UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: [], animations: { 
      cell.frame = collectionView.bounds
    }, completion: {_ in
      collectionView.isScrollEnabled = false
    })
  }
  
  func backButtonDidTouch(){
    guard let indexPaths = collectionView?.indexPathsForSelectedItems else {
      return
    }
    
    collectionView?.isScrollEnabled = true
    collectionView?.reloadItems(at: indexPaths)
  }
}
