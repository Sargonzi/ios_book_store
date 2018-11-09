//
//  PopularBookCollectionViewController.swift
//  BookStore
//
//  Created by Sargon Zi on 11/9/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

private let reuseIdentifier = "BookCollectionViewCell"

class PopularBookCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var popularBookCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       CellRegisterUtil.cellRegister(nibName: reuseIdentifier, collectionView: self.popularBookCollectionView)
      
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return BookDummyData.getBooks().count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! BookCollectionViewCell
        cell.ivBookCover.image = UIImage(named: BookDummyData.getBooks()[indexPath.item].cover!)
        cell.lblTitle.text = BookDummyData.getBooks()[indexPath.item].title ?? "Default title"
        cell.lblTitle.textColor = UIColor.black
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let navigationView = self.storyboard?.instantiateViewController(withIdentifier: "BookDetailViewController") as! UINavigationController
        let vc = navigationView.viewControllers[0] as! BookDetailViewController
        vc.author = BookDummyData.getBooks()[indexPath.item].author
        vc.bookTitle = BookDummyData.getBooks()[indexPath.item].title
        vc.bookText = BookDummyData.getBooks()[indexPath.item].bookDescription
        vc.releaseDate = BookDummyData.getBooks()[indexPath.item].releasedDate
        vc.image = BookDummyData.getBooks()[indexPath.item].cover
        self.present(navigationView, animated: true, completion: nil)
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width / 2) - 16
        return CGSize(width: width, height: 230)
    }
    

    @IBAction func onTapBack(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
