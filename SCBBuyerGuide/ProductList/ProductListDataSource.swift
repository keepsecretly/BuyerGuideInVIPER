//
//  ProductListDataSource.swift
//  SCBBuyerGuide
//
//  Created by NiM on 5/27/2561 BE.
//  Copyright © 2561 NiM. All rights reserved.
//

import UIKit

class ProductListDataSource: NSObject, UITableViewDataSource {
    
    static let CELL_ID = "ProductTableViewCell"
    
    var itemList = [Product]()
    var sortOption:SortOption = .id
    var cellDelegate:ProductTableViewCellDelegate?

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ProductListDataSource.CELL_ID) as? ProductTableViewCell {
            cell.configureCell(with: self.itemList[indexPath.row])
            cell.delegate = self.cellDelegate
            return cell
        }
        
        return UITableViewCell()
    }
    
    func reloadData(sortOption:SortOption = .id, forceUpdate:Bool = false) {
        if sortOption != self.sortOption || forceUpdate {
            self.sortOption = sortOption
            self.itemList = SortProduct().sort(list: self.itemList, by: sortOption)
        }        
    }
}
