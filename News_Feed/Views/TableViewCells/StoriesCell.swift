//
//  StoriesCell.swift
//  News_Feed
//
//  Created by clines329 on 10/20/19.
//  Copyright © 2019 clines329. All rights reserved.
//

import UIKit

class StoriesCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        return cell
    }
    

   
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
         super.awakeFromNib()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
}
