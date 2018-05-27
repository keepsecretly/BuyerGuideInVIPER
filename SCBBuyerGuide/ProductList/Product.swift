//
//  Product.swift
//  SCBBuyerGuide
//
//  Created by NiM on 5/27/2561 BE.
//  Copyright © 2561 NiM. All rights reserved.
//

import Foundation
import Kingfisher

struct Product : Codable, Equatable {
    
    var itemID = 0
    var itemName = ""
    var itemDescription = ""
    var price:Double = 0.0
    var rating:Float = 0.0
    var isFavorited = false
    var imagePath = ""
    var priceString = ""
    var ratingString = ""
    var imageList = [String]()
    
    public static func ==(lhs: Product, rhs: Product) -> Bool {
        return lhs.itemID == rhs.itemID
    }
    
    private enum CodingKeys: String, CodingKey {
        case itemID = "id"
        case itemName = "name"
        case itemDescription = "description"
        case imagePath = "thumbImageURL"
        case rating
        case price        
    }
}
