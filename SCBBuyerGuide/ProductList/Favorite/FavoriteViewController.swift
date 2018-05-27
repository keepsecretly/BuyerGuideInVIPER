//
//  FavoriteViewController.swift
//  SCBBuyerGuide
//
//  Created by NiM on 5/27/2561 BE.
//  Copyright © 2561 NiM. All rights reserved.
//

import UIKit

enum FavoriteAction {
    case add
    case remove
}

class FavoriteViewController: ProductListViewController {

    func shouldUpdateList(with item:Product) {
        if let presenter = self.presenter as? FavoriteProductListPresenterProtocol {
            presenter.shouldUpdateList(with: item)
        }
    }
    
    func shouldRemove(_ item:Product) {
        if let presenter = self.presenter as? FavoriteProductListPresenterProtocol {
            presenter.shouldRemove(item)
        }
    }

}

extension FavoriteViewController {
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        return [
            UITableViewRowAction(style: .destructive, title: Localized("Delete"), handler: { [weak self] (action, indexPath) in
                if let item = self?.presenter?.getItem(at: indexPath.row){
                    if let delegate = self?.delegate {
                        delegate.producListDidSelectFavorite(for: item, selected: false)
                    }
                }
            })
        ]
    }
}
