//
//  AnimationImageCollection.swift
//  CollectionViewAnimation
//
//  Created by Trần Vũ Hưng on 11/29/17.
//  Copyright © 2017 Tran Vu Hung. All rights reserved.
//

import Foundation
import UIKit

struct AnimationImageCollection {
  private let imagePaths = ["1", "2", "3", "4", "5"]
  var images: [AnimationCellModel]
  
  init(){
    images = imagePaths.map({ AnimationCellModel(imagePath: $0) })
  }
}
