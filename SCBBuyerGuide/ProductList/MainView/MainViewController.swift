//
//  MainViewController.swift
//  SCBBuyerGuide
//
//  Created by NiM on 5/27/2561 BE.
//  Copyright © 2561 NiM. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var presenter: MainProductViewPresenterProtocol?
    
    weak var pageViewController:ProductListContainerViewController?
    
    @IBOutlet weak var segment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let _ = MainProductViewRouter.createModule(from: self)

        self.pageViewController?.pageDelegate = self.presenter as? ProductListContainerDelegate

        self.setupSegmentUI()
        self.setupPageViewController()
    }
    
    func setupSegmentUI() {
        let activeAttributes = [
            NSAttributedStringKey.foregroundColor: UIColor.black,
            NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18.0)
        ]
        
        let normalAttributes = [
            NSAttributedStringKey.foregroundColor: UIColor.lightGray,
            NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18.0)
        ]
        
        self.segment.setTitleTextAttributes(activeAttributes, for: UIControlState.selected)
        self.segment.setTitleTextAttributes(normalAttributes, for: UIControlState.normal)
    }
    
    func setupPageViewController() {
        self.pageViewController?.setupView()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let pageViewController = segue.destination as? ProductListContainerViewController {
            self.pageViewController = pageViewController
        }
    }
    
    @IBAction func segmentDidChanged(_ sender: Any) {
        self.changePage(to: self.segment.selectedSegmentIndex)
    }
    
    @IBAction func sortItem(_ sender: Any) {
        let sortView = SortProduct().showOptionSheet(completion: { [weak self] (option) in
            self?.pageViewController?.reloadData(sortOption: option)
        })
        
        self.present(sortView, animated: true, completion: nil)
    }
    
}


extension MainViewController : MainProductViewViewProtocol {
    
    func changePage(to index:Int) {
        self.pageViewController?.changePage(to: index)
    }
    
    func updateSegment(to index: Int) {
        self.segment.selectedSegmentIndex = index
    }
    
    func producListRequestUpdate() {
        if let pageViewController = self.pageViewController {
            pageViewController.reloadData(sortOption: pageViewController.sortOption)
        }
    }
    
}
