//
//  ProductListProtocols.swift
//  SCBBuyerGuide
//
//  Created NiM on 5/27/2561 BE.
//  Copyright © 2561 NiM. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation
import UIKit

//MARK: Wireframe -
protocol ProductListWireframeProtocol: class {

}
//MARK: Presenter -
protocol ProductListPresenterProtocol: class {
    
    func setDataSource(for tableView:UITableView)
    func reloadData(sortOption:SortOption, forceUpdate:Bool)
    func reloadView()
    func requestProductList(for view:UIView)
    func favoriteButtonDidSelect(at index: Int, selected: Bool) -> Product?
    func favoriteShouldRemove(item:Product)
    func getItem(at index:Int) -> Product
    func getIndex(for item: Product) -> Int?
}

//MARK: Interactor -
protocol ProductListInteractorProtocol: class {

    var presenter: ProductListPresenterProtocol?  { get set }
    var dataSource:ProductListDataSource { get set }
    func reloadData(sortOption:SortOption, forceUpdate:Bool)
    func requestProductList(completion:@escaping ((_ itemList:[Product]?, _ errorMessage:String?) -> Void))
    func favoriteButtonDidSelect(at index: Int, selected: Bool) -> Product
    func favoriteShouldRemove(item:Product)
    func getItem(at index:Int) -> Product
    func getIndex(for item: Product) -> Int?
}

//MARK: View -
protocol ProductListViewProtocol: class {

  var presenter: ProductListPresenterProtocol?  { get set }
    func getIndexPath(for cell:UITableViewCell) -> IndexPath?
    func producListDidSelectFavorite(for item:Product, selected: Bool)
    func producListErrorOccur(reason:String)
    func reloadData(sortOption:SortOption, forceUpdate:Bool)
}