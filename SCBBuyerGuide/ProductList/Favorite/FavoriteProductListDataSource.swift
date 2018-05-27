//
//  FavoriteProductListDataSource.swift
//  SCBBuyerGuide
//
//  Created by NiM on 5/27/2561 BE.
//  Copyright © 2561 NiM. All rights reserved.
//

import UIKit

class FavoriteProductListDataSource: ProductListDataSource {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = super.tableView(tableView, cellForRowAt: indexPath) as? ProductTableViewCell {
            cell.hideFavoriteButton()
            return cell
        }
        
        return super.tableView(tableView, cellForRowAt: indexPath)
    }
    
    func addFavorite(item:Product) {
        if !self.itemList.contains(item) {
            self.itemList.append(item)
        }
    }
    
    func removeFavorite(item:Product) {
        if let index = self.itemList.index(of: item) {
            self.itemList.remove(at: index)
        }
    }
}
