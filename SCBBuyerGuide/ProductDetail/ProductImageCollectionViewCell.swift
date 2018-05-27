//
//  ProductImageCollectionViewCell.swift
//  SCBBuyerGuide
//
//  Created by NiM on 5/27/2561 BE.
//  Copyright © 2561 NiM. All rights reserved.
//

import UIKit
import Kingfisher

class ProductImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!

    func configureCell(with imageURL:String) {
        if let url = URL(string: imageURL) {
            self.imageView.kf.setImage(with: url, options: [.transition(.fade(0.2))])
        }
    }
}
