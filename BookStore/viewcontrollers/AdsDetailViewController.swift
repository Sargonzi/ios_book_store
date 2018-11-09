//
//  AdsDetailViewController.swift
//  BookStore
//
//  Created by Sargon Zi on 11/6/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class AdsDetailViewController: UIViewController {
    @IBOutlet weak var ivArticleImage: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    
    var image: String!
    var text: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ivArticleImage.image = UIImage(named: image)
        lblDescription.text = text
    }
    

    @IBAction func onTapBack(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
