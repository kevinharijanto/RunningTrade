//
//  RunningTradeVC+TableView.swift
//  RunningTrade
//
//  Created by Kevin Harijanto on 17/11/22.
//

import UIKit

extension RunningTradeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !filteredData.isEmpty && isFilterEnabled {
            return filteredData.count
        } else {
            return data.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: RunningTradeCell.identifier, for: indexPath) as! RunningTradeCell
        
        if !filteredData.isEmpty && isFilterEnabled {
            cell.stock = filteredData[indexPath.row]
        } else {
            cell.stock = data[indexPath.row]
        }
        
        cell.configure()
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: FooterView.identifier) as! FooterView
        footer.delegate = self
        footer.isEnabled = isFilterEnabled
//        footer.filtersArray = filters
        footer.configure()
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderView.identifier) as! HeaderView
        header.backgroundColor = .rtblue
        return header
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 25
//    }
}
