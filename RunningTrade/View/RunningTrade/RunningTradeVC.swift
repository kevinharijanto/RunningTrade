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
    
    private lazy var tvBG: UIView = {
        let rect = UIView()
        rect.backgroundColor = .rtblack
        return rect
    }()
    
    internal lazy var tableview: UITableView = {
        let tv = UITableView()
        tv.register(RunningTradeCell.self,
                    forCellReuseIdentifier: RunningTradeCell.identifier)
        tv.dataSource = self
        tv.delegate = self
        tv.separatorStyle = .singleLine
        tv.showsVerticalScrollIndicator = false
        tv.contentInset = UIEdgeInsets(top: 25, left: 0, bottom: 0, right: 0)
        tv.bounces = false
        tv.backgroundColor = .clear
        return tv
    }()
    
    private lazy var footerBG: UIView = {
        let rect = UIView()
        rect.backgroundColor = .rtsemiblack
        return rect
    }()
    
    private lazy var filterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Stock Filter", for: .normal)
        button.setTitleColor(.rtorange, for: .normal)
        button.addTarget(self, action: #selector(handleFilter), for: .touchUpInside)
        return button
    }()
    
    private lazy var verticalLine: UIView = {
        let line = UIView()
        line.backgroundColor = .rtgray
        return line
    }()
    
    internal lazy var toggleFilter: UISwitch = {
        let toggle = UISwitch()
        toggle.addTarget(self, action: #selector(self.switchStateDidChange(_:)), for: .valueChanged)
        toggle.onTintColor = .rtorange
        return toggle
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureFooter()
    }
    
    // MARK: - Selectors
    @objc func handleFilter() {
        // show modal
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
    
    @objc func switchStateDidChange(_ sender:UISwitch!) {
        if filters.isEmpty {
            // show alert
            toggleFilter.setOn(false, animated: true)
        }
        
        if (sender.isOn == true){
            isFilterEnabled = true
            toggleFilter.setOn(true, animated: true)
            tableview.reloadData()
        }
        else{
            isFilterEnabled = false
            toggleFilter.setOn(false, animated: true)
            tableview.reloadData()
        }
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        navigationItem.title = "RUNNING TRADE"
        view.backgroundColor = .rtblue
        
        let ihsgView = UIBarButtonItem(customView: IHSGView())
        navigationItem.rightBarButtonItem = ihsgView
        
        view.addSubview(tvBG)
        tvBG.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        view.addSubview(tableview)
        tableview.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }

        let header = RunningTradeHeaderView()
        view.addSubview(header)
        header.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.height.equalTo(25)
            make.horizontalEdges.equalToSuperview()
        }
    }
    
    func configureFooter() {
        view.addSubview(footerBG)
        footerBG.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(60)
            make.horizontalEdges.equalToSuperview()
        }
        
        view.addSubview(filterButton)
        filterButton.snp.makeConstraints { make in
            make.verticalEdges.equalTo(footerBG.snp.verticalEdges).inset(5)
            make.left.equalToSuperview().offset(20)
        }

        view.addSubview(verticalLine)
        verticalLine.snp.makeConstraints { make in
            make.center.equalTo(footerBG.snp.center)
            make.width.equalTo(2)
        }

        view.addSubview(toggleFilter)
        toggleFilter.snp.makeConstraints { make in
            make.centerY.equalTo(footerBG.snp.centerY)
            make.right.equalToSuperview().inset(20)
        }
    }
}

