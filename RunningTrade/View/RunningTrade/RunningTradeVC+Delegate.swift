//
//  RunningTradeVC+Delegate.swift
//  RunningTrade
//
//  Created by Kevin Harijanto on 19/11/22.
//

import UIKit

extension RunningTradeViewController: RunningTradeViewDelegate {
     
    func addFilter(filters: [String]) {
        self.filters = filters
        self.filteredData = data.filter {
            filters.contains($0.stockName)
        }
        
        if filters.isEmpty {
            isFilterEnabled = false
            toggleFilter.setOn(false, animated: true)
        } else {
            isFilterEnabled = true
            toggleFilter.setOn(true, animated: true)
        }
        
        tableview.reloadData()
    }
}

protocol RunningTradeViewDelegate: AnyObject {
    func addFilter(filters: [String])
}
