//
//  FavoriteProductListProtocols.swift
//  SCBBuyerGuide
//
//  Created by NiM on 5/27/2561 BE.
//  Copyright © 2561 NiM. All rights reserved.
//

import Foundation

protocol FavoriteProductListPresenterProtocol : ProductListPresenterProtocol {
    func shouldUpdateList(with item:Product)
    func shouldRemove(_ item:Product)
    func reloadView()
}


protocol FavoriteProductListInteractorProtocol : ProductListInteractorProtocol {
    func shouldUpdateList(with item:Product)
    func shouldRemove(_ item:Product)
}
