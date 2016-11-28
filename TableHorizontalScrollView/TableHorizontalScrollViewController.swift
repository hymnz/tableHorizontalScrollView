//
//  TableHorizontalScrollViewController.swift
//  TableHorizontalScrollView
//
//  Created by pongsil vachirajongkol on 11/27/2559 BE.
//  Copyright © 2559 pongsil vachirajongkol. All rights reserved.
//

import UIKit

class TableHorizontalScrollViewController: UITableViewController {

    var offsets:CGFloat = 0.0
    
    
    let numberOfRows = 20
    let numberOfItemsPerRow = 15
    
    override func viewDidLoad() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 30
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "header"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let tableViewCell = cell as? TableHorizontalViewCell else { return }
        
        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
        tableViewCell.collectionViewOffset = offsets
    }
    
}

extension TableHorizontalScrollViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItemsPerRow
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HorizontalCollectionViewCell
        
        cell.label.text = "xxx"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        cellDidScroll(scrollView)
    }
    
    func cellDidScroll(_ cell: UIScrollView) {
        if offsets != cell.contentOffset.x {
            offsets = cell.contentOffset.x
            
            for case let visibleCell as TableHorizontalViewCell in self.tableView.visibleCells {
                visibleCell.collectionViewOffset = offsets
            }
        }
    }
}
