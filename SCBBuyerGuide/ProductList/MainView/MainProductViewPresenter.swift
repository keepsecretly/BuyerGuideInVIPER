//
//  MainProductViewPresenter.swift
//  SCBBuyerGuide
//
//  Created NiM on 5/27/2561 BE.
//  Copyright © 2561 NiM. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class MainProductViewPresenter: MainProductViewPresenterProtocol {

    weak private var view: MainProductViewViewProtocol?
    var interactor: MainProductViewInteractorProtocol?
    private let router: MainProductViewWireframeProtocol

    init(interface: MainProductViewViewProtocol, interactor: MainProductViewInteractorProtocol?, router: MainProductViewWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
}

extension MainProductViewPresenter : ProductListContainerDelegate {
    
    func viewDidChanged(to index: Int) {
        self.view?.updateSegment(to: index)
    }
    
    func showProductDetail(for item: Product) {
        self.router.showProductDetail(for: item)
    }
    
    func requestPage(at index:Int) -> UIViewController? {
        return self.interactor?.requestPage(at:index)
    }
    
    func setNeedUpdateController() {        
        if let controllerList = self.interactor?.controllerList {
            for controller in controllerList {
                controller.needUpdate = true
            }
        }
    }
    
    func getIndex(for controller:UIViewController? = nil) -> Int? {
        return self.interactor?.getIndex(for: controller)
    }
    
    func isLowerBound(_ index: Int) -> Bool {
        return self.interactor?.isLowerBound(index) ?? false
    }
    
    func producListRequestUpdate() {
        self.view?.producListRequestUpdate()
    }
    
    func showAlert(message: String) {
        self.view?.showAlert(message: message)
    }
}

