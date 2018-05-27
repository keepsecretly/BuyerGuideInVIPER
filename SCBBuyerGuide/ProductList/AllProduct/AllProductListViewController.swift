//
//  AllProductListViewController.swift
//  SCBBuyerGuide
//
//  Created by NiM on 5/27/2561 BE.
//  Copyright © 2561 NiM. All rights reserved.
//

import UIKit
import JGProgressHUD

class AllProductListViewController: ProductListViewController {    

    override func requestProductList() {
        self.presenter?.requestProductList(for: self.navigationController?.view ?? self.view)
    }

}
