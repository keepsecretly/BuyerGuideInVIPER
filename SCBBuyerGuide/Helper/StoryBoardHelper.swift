//
//  StoryBoardHelper.swift
//  SCBBuyerGuide
//
//  Created by NiM on 5/27/2561 BE.
//  Copyright © 2561 NiM. All rights reserved.
//

import Foundation
import UIKit

struct StoryBoardHelper {
    
    static let MAIN = "Main"
    static let LIST_NIB_NAME = "ProductListViewController"
    static let DETAIL_ID = "ProductDetailViewController"
    
    static func getAllProductListController() -> ProductListViewController? {
        return ProductListRouter.createModule(view: AllProductListViewController(nibName: LIST_NIB_NAME, bundle: Bundle.main))
    }
    
    static func getFavoriteListController() -> ProductListViewController? {
        return FavoriteProductListRouter.createModule(view: FavoriteViewController(nibName: LIST_NIB_NAME, bundle: Bundle.main))
    }
    
    static func getProductDetail() -> ProductDetailViewController {
        let storyBoard = UIStoryboard(name: StoryBoardHelper.MAIN, bundle: Bundle.main)
        return storyBoard.instantiateViewController(withIdentifier: DETAIL_ID) as! ProductDetailViewController
    }
}
