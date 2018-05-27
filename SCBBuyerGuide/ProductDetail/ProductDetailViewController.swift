//
//  ProductDetailViewController.swift
//  SCBBuyerGuide
//
//  Created by NiM on 5/27/2561 BE.
//  Copyright © 2561 NiM. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    var product:Product?
    var presenter: ProductDetailPresenterProtocol?

    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupProductDetail()
        self.presenter?.requestImageList(for: self.navigationController?.view ?? self.view)
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }

    func setupProductDetail() {
        self.title = product?.itemName
        self.descriptionTextView.text = product?.itemDescription
        self.priceLabel.text = "\(Localized("Price")): \(product?.priceString ?? "")"
        self.ratingLabel.text = "\(Localized("Rating")): \(product?.ratingString ?? "")"
        self.imageHeightConstraint.constant = UIScreen.main.bounds.height*0.35
    }    

}

extension ProductDetailViewController : ProductDetailViewProtocol {
    
    func getProduct() -> Product? {
        return self.product
    }
    
    func updateImageList(imageList:[String]) {
        self.product?.imageList = imageList
        self.collectionView.reloadData()
    }
}

extension ProductDetailViewController : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.product?.imageList.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        if let imageCell = cell as? ProductImageCollectionViewCell {
            imageCell.configureCell(with: self.product?.imageList[indexPath.item] ?? "")
        }
        
        return cell
    }
    
}

extension ProductDetailViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.width*0.5, height: self.imageHeightConstraint.constant)
    }
    
}
