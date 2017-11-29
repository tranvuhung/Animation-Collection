//
//  AnimationCellModel.swift
//  CollectionViewAnimation
//
//  Created by Trần Vũ Hưng on 11/29/17.
//  Copyright © 2017 Tran Vu Hung. All rights reserved.
//

import Foundation

struct AnimationCellModel {
  let imagePath: String
  
  init(imagePath: String?){
    self.imagePath = imagePath ?? ""
  }
}
