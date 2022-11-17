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
        tv.dataSource = self
        tv.delegate = self
        tv.separatorStyle = .singleLine
        tv.showsVerticalScrollIndicator = false
        tv.contentInset = UIEdgeInsets(top: 25, left: 0, bottom: 0, right: 0)
        tv.bounces = false
        tv.backgroundColor = .clear
        return tv
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNav()
        configureUI()
    }
    
    // MARK: - Selectors
    
    
    // MARK: - Helpers
    
    func configureNav() {
//        navigationBar.prefersLargeTitles = false
        navigationItem.title = "RUNNING TRADE"
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = .rtblue
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
//        UINavigationBar.standardAppearance = navBarAppearance
    }
    
    func configureUI() {
        view.backgroundColor = .rtblue
        
        view.addSubview(tableview)
        tableview.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        let header = RunningTradeHeaderView()
        view.addSubview(header)
        header.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.height.equalTo(25)
            make.horizontalEdges.equalToSuperview()
        }
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
