//
//  PoductModel.swift
//  pageTest
//
//  Created by kiran on 1/8/19.
//  Copyright © 2019 kiran. All rights reserved.
//

import Foundation

struct ProductModel: Codable {
    
    var title: String?
    var regularPrice: Int?
    var salePrice: Int?
    var productDescroption: String?
    var images: [Image]?
    
    private enum CodingKeys: String, CodingKey {
        case title = "name"
        case images = "images"
    }
    
}



struct Image: Codable {

    var source: String?
    
    private enum CodingKeys: String, CodingKey {
        case source = "src"

    }

}
