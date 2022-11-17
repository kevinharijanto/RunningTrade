//
//  RunningTradeView.swift
//  RunningTrade
//
//  Created by Kevin Harijanto on 16/11/22.
//

import UIKit
import SnapKit

class RunningTradeViewController: UIViewController {
    
    // MARK: - Properties
    
    var data = Stock.data
    var filteredData = [Stock]()
    internal var filters = [String]()
    internal var isFilterEnabled = false
    
    internal lazy var tableview: UITableView = {
        let tv = UITableView()
        tv.register(RunningTradeCell.self,
                    forCellReuseIdentifier: RunningTradeCell.identifier)
        tv.register(FooterView.self, forHeaderFooterViewReuseIdentifier: FooterView.identifier)
        tv.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: HeaderView.identifier)
        tv.dataSource = self
        tv.delegate = self
        tv.separatorStyle = .singleLine
        tv.showsVerticalScrollIndicator = false
        tv.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tv.bounces = false
        tv.backgroundColor = .rtblack
        return tv
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Selectors
    
    
    // MARK: - Helpers
    
    func configureUI() {
        
        view.addSubview(tableview)
        tableview.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
//        tableview.anchor(top: view.safeAreaLayoutGuide.topAnchor,
//                         leading: view.safeAreaLayoutGuide.leadingAnchor,
//                         bottom: view.safeAreaLayoutGuide.bottomAnchor,
//                         trailing: view.safeAreaLayoutGuide.trailingAnchor)

//        let header = RunningTradeHeaderView()
//        view.addSubview(header)
//        header.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
//            make.height.equalTo(25)
//            make.horizontalEdges.equalToSuperview()
//        }
        
//        let footer = RunningTradeFooterView(isEnabled: false)
//        footer.delegate = self
//        view.addSubview(footer)
//        footer.anchor(left: view.leftAnchor,
//                      bottom: view.safeAreaLayoutGuide.bottomAnchor,
//                      right: view.rightAnchor,
//                      height: 40)
//        footer.snp.makeConstraints { make in
//            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
//            make.height.equalTo(40)
//            make.horizontalEdges.equalToSuperview()
//        }
    }
}

extension RunningTradeViewController: RunningTradeViewDelegate {
    func showModal() {
        let vc = StockFilterView(filters: filters)
        vc.filters = filters
        vc.delegate = self
        let navVC = UINavigationController(rootViewController: vc)
        navVC.isModalInPresentation = true
        if let sheet = navVC.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.preferredCornerRadius = 20
        }
        present(navVC, animated: true, completion: nil)
    }
     
    func addFilter(filters: [String]) {
        self.filters = filters
        self.filteredData = data.filter {
            filters.contains($0.stockName)
        }
        if !filters.isEmpty {
            isFilterEnabled = true
        }
        tableview.reloadData()
    }
    
    func enableFilter() {
        isFilterEnabled = true
        tableview.reloadData()
    }
    
    func disableFilter() {
        isFilterEnabled = false
        tableview.reloadData()
    }
}

protocol RunningTradeViewDelegate: AnyObject {
    func showModal()
    func addFilter(filters: [String])
    func enableFilter()
    func disableFilter()
}
