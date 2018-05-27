//
//  FavoriteProductListInteractor.swift
//  SCBBuyerGuide
//
//  Created by NiM on 5/27/2561 BE.
//  Copyright © 2561 NiM. All rights reserved.
//

import Foundation

class FavoriteProductListInteractor: ProductListInteractor, FavoriteProductListInteractorProtocol {
    
    override lazy var dataSource: ProductListDataSource = {
        return FavoriteProductListDataSource()
    }()
    
    func shouldUpdateList(with item:Product) {
        
        if let favoriteDataSource = self.dataSource as? FavoriteProductListDataSource {
            favoriteDataSource.addFavorite(item: item)
        }
        
        self.presenter?.reloadView()
    }
    
    func shouldRemove(_ item:Product) {
        
        if let favoriteDataSource = self.dataSource as? FavoriteProductListDataSource {
            favoriteDataSource.removeFavorite(item: item)
        }
        
        self.presenter?.reloadView()
    }
}
