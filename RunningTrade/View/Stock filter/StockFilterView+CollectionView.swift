//
//  StockFilterView+CollectionView.swift
//  RunningTrade
//
//  Created by Kevin Harijanto on 17/11/22.
//

import UIKit

extension StockFilterView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filters.count + 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row < filters.count {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StockFilterCell.identifier, for: indexPath) as! StockFilterCell
            cell.delegate = self
            cell.stockName = filters[indexPath.row]
            cell.configure()
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StockAddCell.identifier, for: indexPath) as! StockAddCell
        cell.delegate = self
        return cell
    }
}
