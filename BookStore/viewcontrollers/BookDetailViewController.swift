//
//  BookDetailViewController.swift
//  BookStore
//
//  Created by Sargon Zi on 11/6/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {

    @IBOutlet weak var ivCover: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    var image: String!
    var bookTitle: String!
    var author: String!
    var releaseDate: String!
    var bookText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ivCover.image = UIImage(named: image)
        lblTitle.text = bookTitle
        lblAuthor.text = author
        lblReleaseDate.text = releaseDate
        lblDescription.text = bookText

    }
    

    @IBAction func onTapBack(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
