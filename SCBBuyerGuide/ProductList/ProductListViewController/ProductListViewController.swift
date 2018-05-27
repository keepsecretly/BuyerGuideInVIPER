//
//  ProductListViewController.swift
//  SCBBuyerGuide
//
//  Created by NiM on 5/27/2561 BE.
//  Copyright © 2561 NiM. All rights reserved.
//

import UIKit

protocol ProductListViewDelegate {
    func producListErrorOccur(reason:String)
    func producListRequestUpdate()
    func producListDidSelectItem(item:Product)
    func producListDidSelectFavorite(for item:Product, selected: Bool)
}

class ProductListViewController: UITableViewController {
    
    var delegate:ProductListViewDelegate?
    var presenter: ProductListPresenterProtocol?

    var needUpdate = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter?.setDataSource(for: self.tableView)
        
        self.tableView.register(UINib(nibName: ProductListDataSource.CELL_ID, bundle: Bundle.main), forCellReuseIdentifier: ProductListDataSource.CELL_ID)
        
        self.tableView.delegate = self
        self.tableView.tableFooterView = UIView()
        self.requestProductList()
    }
    
    func requestProductList() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if self.needUpdate {
            self.needUpdate = false
            
            if let delegate = self.delegate {
                delegate.producListRequestUpdate()
            }
        }
    }

}

extension ProductListViewController : ProductListViewProtocol {
    
    func getIndexPath(for cell: UITableViewCell) -> IndexPath? {
        return self.tableView.indexPath(for: cell)
    }
    
    func producListDidSelectFavorite(for item:Product, selected: Bool) {
        if let delegate = self.delegate {
            delegate.producListDidSelectFavorite(for: item, selected: selected)
        }
    }
    
    func producListErrorOccur(reason: String) {
        if let delegate = self.delegate {
            delegate.producListErrorOccur(reason: reason)
        }
    }
    
    func reloadData(sortOption:SortOption = .id, forceUpdate:Bool = false) {
        self.needUpdate = false
        self.presenter?.reloadData(sortOption: sortOption, forceUpdate: forceUpdate)
        self.tableView.reloadData()
    }
}

extension ProductListViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let delegate = self.delegate,
            let item = self.presenter?.getItem(at: indexPath.row) {
                delegate.producListDidSelectItem(item: item)
        }
    }
}
