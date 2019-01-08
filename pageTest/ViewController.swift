//
//  ViewController.swift
//  pageTest
//
//  Created by kiran on 1/8/19.
//  Copyright © 2019 kiran. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    var productDataArray = [ProductModel]()

    var currentPage = 1
    var isloading = false

    @IBOutlet weak var productVC: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        productVC.delegate = self
        productVC.dataSource = self
        getProductData(page: currentPage, catagory: 64)
    }
    
    let baseUrl = AppConstant.productUrl
    func getProductData(page: Int, catagory: Int) {
        let parameters: [String: AnyObject] = ["category": catagory as AnyObject,
                                               "consumer_key": "ck_ae7125c511b7db39f52dfd633b742c748d09150e" as AnyObject,
                                               "consumer_secret": "cs_177eadbb770d4a1c6c486207aaec53fc53c48ac6" as AnyObject,
                                               "page": page as AnyObject]
        
        
        let req = Alamofire.request(baseUrl, method: .get, parameters: parameters)
        req.validate(statusCode: 200..<300)
        req.validate(contentType: ["application/json"])
        req.responseJSON { (response) in
            guard let data = response.data else { return }
            
            self.isloading = true
            
            do {
                
                let res = try JSONDecoder().decode([ProductModel].self, from: data)
                for re in res {
                  self.productDataArray.append(re)
                }
                
                DispatchQueue.main.async {
                    self.isloading = false
                    self.productVC.reloadData()
                }

                
            }
            catch let err {
                
                print(err)
            }
        }
    }
    
    
    func fetchNextPage(){
        currentPage += 1
        getProductData(page: currentPage, catagory: 64)
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productDataArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = productVC.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? productCell
        cell?.productTitle.text = productDataArray[indexPath.row].title
        cell?.productImage.downloadImages(url: productDataArray[indexPath.row].images![0].source!)
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let lastData = self.productDataArray.count - 1
        if !isloading && indexPath.row == lastData {
            currentPage += 1
            self.fetchNextPage()
        }
    }
    
    
}

