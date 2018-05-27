//
//  ProductListContainerViewController.swift
//  SCBBuyerGuide
//
//  Created by NiM on 5/27/2561 BE.
//  Copyright © 2561 NiM. All rights reserved.
//

import UIKit

protocol ProductListContainerDelegate {
    func getIndex(for controller:UIViewController?) -> Int?
    func isLowerBound(_ index:Int) -> Bool
    func requestPage(at index:Int) -> UIViewController?
    func setNeedUpdateController()
    func showProductDetail(for item:Product)
    func viewDidChanged(to index:Int)
}

class ProductListContainerViewController: UIPageViewController {
    
    var pageDelegate:ProductListContainerDelegate?

    var sortOption:SortOption = .id    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.dataSource = nil
        self.delegate = self
    }

    func setupView() {
        if let productListViewController = self.pageDelegate?.requestPage(at: 0) {
            self.setViewControllers([productListViewController], direction: .forward, animated: false, completion: nil)
        }
        
        self.reloadData()
    }
    
    func changePage(to index:Int) {
        if let controller = self.pageDelegate?.requestPage(at: index),
            let currentIndex = self.getIndex(){
            let direction:UIPageViewControllerNavigationDirection = (currentIndex < index ? .forward : .reverse)
            self.setViewControllers([controller], direction: direction, animated: true, completion: nil)
        }
    }
    
    func reloadData(sortOption:SortOption = .id) {
        if self.sortOption != sortOption {
            self.pageDelegate?.setNeedUpdateController()
        }

        self.sortOption = sortOption
        if let productListViewController = self.viewControllers?.first as? ProductListViewController {
            productListViewController.reloadData(sortOption: self.sortOption)
        }
    }
    
    fileprivate func getIndex(for controller:UIViewController? = nil) -> Int? {
        let viewController = (controller ?? self.viewControllers?.first)
        return self.pageDelegate?.getIndex(for: viewController)
    }
}

extension ProductListContainerViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if finished {
            if let index = self.getIndex(),
                let delegate = self.pageDelegate {
                 delegate.viewDidChanged(to: index)
            }
        }
    }
}
