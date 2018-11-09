//
//  PopularBookCollectionViewCell.swift
//  BookStore
//
//  Created by Sargon Zi on 11/4/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class PopularBookCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lblPopularBooks: UILabel!
    @IBOutlet weak var popularBookCollectionview: UICollectionView!
    @IBOutlet weak var btnMore: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.popularBookCollectionview.dataSource = self
        self.popularBookCollectionview.delegate = self
        CellRegisterUtil.cellRegister(nibName: "BookCollectionViewCell", collectionView: self.popularBookCollectionview)
    }
    
    
    @IBAction func onClickMore(_ sender: Any) {
       let navigationViewConroller = self.window?.rootViewController!.storyboard!.instantiateViewController(withIdentifier: "PopularBookCollectionViewController") as! UINavigationController
       self.window?.rootViewController!.present(navigationViewConroller, animated: true, completion: nil)
    }
    
}

extension PopularBookCollectionViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return BookDummyData.getBooks().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as! BookCollectionViewCell
        //Data binding with dummy Book data
        cell.ivBookCover.image = UIImage(named: BookDummyData.getBooks()[indexPath.item].cover!)
        cell.lblTitle.text = BookDummyData.getBooks()[indexPath.item].title ?? "Default title"
        return cell
    }
    
}

extension PopularBookCollectionViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 225)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //here will be the click action of book item and call detail view
        let navigationView = self.window?.rootViewController?.storyboard?.instantiateViewController(withIdentifier: "BookDetailViewController") as! UINavigationController
        let vc = navigationView.viewControllers[0] as! BookDetailViewController
        vc.author = BookDummyData.getBooks()[indexPath.item].author
        vc.bookTitle = BookDummyData.getBooks()[indexPath.item].title
        vc.bookText = BookDummyData.getBooks()[indexPath.item].bookDescription
        vc.releaseDate = BookDummyData.getBooks()[indexPath.item].releasedDate
        vc.image = BookDummyData.getBooks()[indexPath.item].cover
        self.window?.rootViewController?.present(navigationView, animated: true, completion: nil)
      
    }
    
}
