//
//  CellRegisterUtil.swift
//  BookStore
//
//  Created by Sargon Zi on 11/5/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class CellRegisterUtil {
    
    static func cellRegister(nibName: String, collectionView: UICollectionView){
        let nib = UINib(nibName: nibName, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: nibName)
    }
}
