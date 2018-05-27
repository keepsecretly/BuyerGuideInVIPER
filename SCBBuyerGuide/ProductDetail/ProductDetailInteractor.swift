//
//  ProductDetailInteractor.swift
//  SCBBuyerGuide
//
//  Created NiM on 5/27/2561 BE.
//  Copyright © 2561 NiM. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class ProductDetailInteractor: ProductDetailInteractorInputProtocol {

    weak var presenter: ProductDetailInteractorOutputProtocol?
    
    func requestImageList(for itemID:String, completion:@escaping ((_ imageList:[String]?, _ errorMessage:String?) -> Void)) {
        let request = APIProductImageList()
        request.itemID = itemID
        request.requestWithJSONHandler { (response) in
            if let imageResponse = response as? APIProductImageListResponse {
                completion(imageResponse.imageList, nil)
            } else if let error = response.error {
                completion(nil, error.localizedDescription)
            }
        }
    }
}