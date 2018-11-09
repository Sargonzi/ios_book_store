//
//  ArticleCollectionViewCell.swift
//  BookStore
//
//  Created by Sargon Zi on 11/9/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class ArticleCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ivArticleImage: UIImageView!
    @IBOutlet weak var lblArticleTitle: UILabel!
    @IBOutlet weak var lblArticleDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
