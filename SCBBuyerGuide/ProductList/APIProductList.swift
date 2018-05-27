//
//  APIProductList.swift
//  SCBBuyerGuide
//
//  Created by NiM on 5/27/2561 BE.
//  Copyright © 2561 NiM. All rights reserved.
//

import Foundation

class APIProductList : API {
    
    override var urlString: String {
        return BASE_URL + "/api/mobiles/"
    }
    
    override func responseClass() -> AnyClass {
        return APIProductListResponse.self
    }
}

class APIProductListResponse: APIResponse {
    
    var productList:[Product]?
    
    private let numberFormatter = NumberFormatter()
    
    required init() {
        super.init()
        
        self.numberFormatter.numberStyle = .currency
    }
    
    override func createModel(with data: Data) {
        do {
            let decoder = JSONDecoder()
            let list = try decoder.decode([Product].self, from: data)
            
            productList = list.map({ (product) -> Product in
                var p = product
                p.ratingString = String(format: "%.1f", p.rating)
                p.priceString = self.numberFormatter.string(from: p.price as NSNumber) ?? ""
                return p
            })
        } catch let err {
            print("Cannot decode json", err)
        }
    }
}
