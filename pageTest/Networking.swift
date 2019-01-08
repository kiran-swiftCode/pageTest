////
////  Networking.swift
////  pageTest
////
////  Created by kiran on 1/8/19.
////  Copyright © 2019 kiran. All rights reserved.
////
//
//import Foundation
//
//import Alamofire
//
//class NetworkingCall {
//
//    let baseUrl = AppConstant.productUrl
//
//   
//
//
//    func getProductData(page: Int, catagory: Int) -> [ProductModel]{
//         var productDataArray = [ProductModel]()
//
//        let parameters: [String: AnyObject] = ["category": catagory as AnyObject,
//                                               "consumer_key": "ck_ae7125c511b7db39f52dfd633b742c748d09150e" as AnyObject,
//                                               "consumer_secret": "cs_177eadbb770d4a1c6c486207aaec53fc53c48ac6" as AnyObject,
//                                               "page": page as AnyObject]
//
//
//        let req = Alamofire.request(baseUrl, method: .get, parameters: parameters)
//        req.validate(statusCode: 200..<300)
//        req.validate(contentType: ["application/json"])
//        req.responseJSON { (response) in
//            guard let productsData = response.result.value as? [[String: AnyObject]] else { return }
//
//            for product in productsData {
//
//                productDataArray.append(ProductModel(productJsonL: product as [String: AnyObject]))
//            }
////            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
//
//        }
//        return productDataArray
//    }
//
//
//}
