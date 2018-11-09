//
//  ViewController.swift
//  BookStore
//
//  Created by Sargon Zi on 11/4/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainCollectionView.dataSource = self
        self.mainCollectionView.delegate = self
        CellRegisterUtil.cellRegister(nibName: "AdsBookCollectionViewCell", collectionView: self.mainCollectionView)
        CellRegisterUtil.cellRegister(nibName: "PopularBookCollectionViewCell", collectionView: self.mainCollectionView)
        CellRegisterUtil.cellRegister(nibName: "ArticlesCollectionViewCell", collectionView: self.mainCollectionView)
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else if section == 1{
            return 1
        } else {
            return 1
        }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdsBookCollectionViewCell", for: indexPath) as! AdsBookCollectionViewCell
            return cell
        } else if indexPath.section == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularBookCollectionViewCell", for: indexPath) as! PopularBookCollectionViewCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticlesCollectionViewCell", for: indexPath) as! ArticlesCollectionViewCell
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
        return CGSize(width: self.view.frame.width, height: 200)
        } else if indexPath.section == 1 {
             return CGSize(width: self.view.frame.width, height: 230)
        } else {
             return CGSize(width: self.view.frame.width, height: view.frame.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let navigationView = self.storyboard?.instantiateViewController(withIdentifier: "AdsDetailViewController") as! UINavigationController
            let vc = navigationView.viewControllers[0] as! AdsDetailViewController
            vc.image =  "book_ads"
            vc.text = DummyData.getNews()[0].newsDescription
            self.present(navigationView, animated: true, completion: nil)
            
        }
    }
    
}


