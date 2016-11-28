//
//  TableHorizontalViewCell.swift
//  TableHorizontalScrollView
//
//  Created by pongsil vachirajongkol on 11/27/2559 BE.
//  Copyright © 2559 pongsil vachirajongkol. All rights reserved.
//

import UIKit

class TableHorizontalViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!

}

extension TableHorizontalViewCell : UIScrollViewDelegate {
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
        
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.setContentOffset(collectionView.contentOffset, animated:false) // Stops collection view if it was scrolling.
        collectionView.reloadData()
    }
    
    var collectionViewOffset: CGFloat {
        set { collectionView.contentOffset.x = newValue }
        get { return collectionView.contentOffset.x }
    }
}
