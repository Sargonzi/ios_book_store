//
//  ArticlesCollectionViewCell.swift
//  BookStore
//
//  Created by Sargon Zi on 11/9/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class ArticlesCollectionViewCell: UICollectionViewCell, UICollectionViewDelegateFlowLayout {


    @IBOutlet weak var articleCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.articleCollectionView.dataSource = self
        self.articleCollectionView.delegate = self
        CellRegisterUtil.cellRegister(nibName: "ArticleCollectionViewCell", collectionView: self.articleCollectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: 230)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          let navigationView = self.window?.rootViewController?.storyboard?.instantiateViewController(withIdentifier: "AdsDetailViewController") as! UINavigationController
            let vc = navigationView.viewControllers[0] as! AdsDetailViewController
            vc.image = DummyData.getNews()[indexPath.item].newsImage
            vc.text = DummyData.getNews()[indexPath.item].newsDescription
            self.window?.rootViewController?.present(navigationView, animated: true, completion: nil)
    }

}


extension ArticlesCollectionViewCell: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DummyData.getNews().count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticleCollectionViewCell", for: indexPath) as! ArticleCollectionViewCell
        cell.ivArticleImage.image = UIImage(named: DummyData.getNews()[indexPath.item].newsImage)
        cell.lblArticleTitle.text = DummyData.getNews()[indexPath.item].newsTitle
        cell.lblArticleDate.text = DummyData.getNews()[indexPath.item].newsReleaseDate
        return cell
    }
    
    
}

