//
//  GoodsEntity.swift
//  SceneKitDemo
//
//  Created by yichen on 2018/3/23.
//  Copyright © 2018年 vDesign. All rights reserved.
//

import Foundation

struct GoodsEntity {
    
    var goodsNumber: String!
    var daePath: String!
    var mainMaterials: [String: MaterialEntity]!
    
}

struct MaterialEntity {
    
    var materialName: String!
    var diffusePath: String!
    var metalnessPath: String!
    var roughnessPath: String!
    var normalPath: String!
    
}
