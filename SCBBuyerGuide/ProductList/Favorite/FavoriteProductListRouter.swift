//
//  FavoriteProductListRouter.swift
//  SCBBuyerGuide
//
//  Created by NiM on 5/27/2561 BE.
//  Copyright © 2561 NiM. All rights reserved.
//

import Foundation
import UIKit

class FavoriteProductListRouter: ProductListWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule(view:ProductListViewController?) -> ProductListViewController? {
        // Change to get view from storyboard if not using progammatic UI
        let interactor = FavoriteProductListInteractor()
        let router = FavoriteProductListRouter()
        
        if let listView = view {
            let presenter = FavoriteProductListPresenter(interface: listView, interactor: interactor, router: router)
            listView.presenter = presenter
            interactor.presenter = presenter
        }
        
        router.viewController = view
        
        return view
    }
}
