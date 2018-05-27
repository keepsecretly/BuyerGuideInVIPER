//
//  FavoriteProductListPresenter.swift
//  SCBBuyerGuide
//
//  Created by NiM on 5/27/2561 BE.
//  Copyright © 2561 NiM. All rights reserved.
//

import Foundation

class FavoriteProductListPresenter: ProductListPresenter, FavoriteProductListPresenterProtocol {

    func shouldUpdateList(with item: Product) {
        if let interactor = self.interactor as? FavoriteProductListInteractorProtocol {
            interactor.shouldUpdateList(with:item)
        }
    }
    
    func shouldRemove(_ item: Product) {
        if let interactor = self.interactor as? FavoriteProductListInteractorProtocol {
            interactor.shouldRemove(item)
        }
    }
    
}
