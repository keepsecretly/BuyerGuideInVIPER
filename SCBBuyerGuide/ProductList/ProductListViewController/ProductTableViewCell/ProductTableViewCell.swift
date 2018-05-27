//
//  ProductTableViewCell.swift
//  SCBBuyerGuide
//
//  Created by NiM on 5/27/2561 BE.
//  Copyright © 2561 NiM. All rights reserved.
//

import UIKit
import Kingfisher

protocol ProductTableViewCellDelegate {
    func favoriteButtonDidSelect(at cell:ProductTableViewCell, selected:Bool)
}

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var delegate:ProductTableViewCellDelegate?
    
    func configureCell(with item:Product) {
        self.productTitleLabel.text = item.itemName
        self.productDescriptionLabel.text = item.itemDescription
        self.priceLabel.text = "\(Localized("Price")): \(item.priceString)"
        self.ratingLabel.text = "\(Localized("Rating")): \(item.ratingString)"
        self.favoriteButton.isSelected = item.isFavorited
        self.favoriteButton.isUserInteractionEnabled = !item.isFavorited
        
        if let url = URL(string: item.imagePath) {
            self.productImageView.kf.setImage(with: url, options: [.transition(.fade(0.2))])
        }
    }

    @IBAction func favoriteAction(_ sender: Any) {
        self.favoriteButton.isSelected = !self.favoriteButton.isSelected
        self.favoriteButton.isUserInteractionEnabled = !self.favoriteButton.isSelected

        if let delegate = self.delegate {
            delegate.favoriteButtonDidSelect(at: self, selected: self.favoriteButton.isSelected)
        }
    }
    
    func hideFavoriteButton() {
        self.favoriteButton.isHidden = true
    }
}
