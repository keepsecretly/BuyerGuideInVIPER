//
//  SortProduct.swift
//  SCBBuyerGuide
//
//  Created by NiM on 5/27/2561 BE.
//  Copyright © 2561 NiM. All rights reserved.
//

import Foundation
import UIKit

enum SortOption {
    case id
    case lowToHigh
    case highToLow
    case rating
    
    func title() -> String {
        switch self {
        case .id:
            return ""
        case .lowToHigh:
            return Localized("Price low to high")
        case .highToLow:
            return Localized("Price high to low")
        case .rating:
            return Localized("Rating")
        }
    }
}

struct SortProduct {
    
    func showOptionSheet(completion:@escaping ((SortOption) -> Void)) -> UIAlertController {
        let actionView = UIAlertController(title: Localized("Sort"), message: nil, preferredStyle: .alert)
        actionView.addAction(self.action(from: .lowToHigh, handler:completion))
        actionView.addAction(self.action(from: .highToLow, handler:completion))
        actionView.addAction(self.action(from: .rating, handler:completion))
        actionView.addAction(UIAlertAction(title: Localized("Cancel"), style: .cancel, handler: nil))
        return actionView
    }
    
    private func action(from option:SortOption, handler:@escaping ((SortOption) -> Void)) -> UIAlertAction {
        return UIAlertAction(title: option.title(), style: .default, handler: { (action) in
            handler(option)
        })
    }
    
    func sort(list:[Product], by option:SortOption) -> [Product] {
        return list.sorted(by: { (item1, item2) -> Bool in
            
            switch option {
                
            case .id:
                return (item1.itemID < item2.itemID)

            case .lowToHigh:
                return (item1.price < item2.price)
                
            case .highToLow:
                return (item1.price > item2.price)
                
            case .rating:
                return (item1.rating > item2.rating)
            }
            
        })
    }
}
