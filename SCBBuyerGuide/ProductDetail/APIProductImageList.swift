//
//  APIProductImageList.swift
//  SCBBuyerGuide
//
//  Created by NiM on 5/27/2561 BE.
//  Copyright © 2561 NiM. All rights reserved.
//

import Foundation

class APIProductImageList : API {
    
    var itemID = ""
    
    override var urlString: String {
        return BASE_URL + "/api/mobiles/" + self.itemID + "/images/"
    }
    
    override func responseClass() -> AnyClass {
        return APIProductImageListResponse.self
    }
}

class APIProductImageListResponse : APIResponse {
    
    var imageList = [String]()
    
    override func createJSONModel(with json: Any) {
        super.createJSONModel(with: json)
        
        if let array = json as? [[String:Any]] {
            for item in array {
                if let imageURL = item["url"] as? String {
                    imageList.append(imageURL)
                }
            }
        }
    }
}
