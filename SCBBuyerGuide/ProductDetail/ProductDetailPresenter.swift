//
//  ProductDetailPresenter.swift
//  SCBBuyerGuide
//
//  Created NiM on 5/27/2561 BE.
//  Copyright © 2561 NiM. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit
import JGProgressHUD

class ProductDetailPresenter: ProductDetailPresenterProtocol, ProductDetailInteractorOutputProtocol {

    weak private var view: ProductDetailViewProtocol?
    var interactor: ProductDetailInteractorInputProtocol?
    private let router: ProductDetailWireframeProtocol

    init(interface: ProductDetailViewProtocol, interactor: ProductDetailInteractorInputProtocol?, router: ProductDetailWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

    func requestImageList(for view:UIView) {
        let progress = JGProgressHUD()
        progress.show(in: view)
        
        let itemID = "\(self.view?.getProduct()?.itemID ?? 0)"
        self.interactor?.requestImageList(for: itemID, completion: { [weak self] (imageList, errorMessage) in
            progress.dismiss()
            
            if let imageList = imageList {
                self?.view?.updateImageList(imageList: imageList)
            } else if let message = errorMessage {
                self?.view?.showAlert(message: message)
            }
        })
    }
}
