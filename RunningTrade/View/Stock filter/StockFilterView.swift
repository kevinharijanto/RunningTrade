//
//  StockFilterView.swift
//  RunningTrade
//
//  Created by Kevin Harijanto on 17/11/22.
//

import UIKit
import SnapKit

class StockFilterView: UIViewController {
    // MARK: - Properties
    var filters: [String]
    weak var delegate: RunningTradeViewDelegate?
    
    private lazy var background: UIView = {
        let rect = UIView()
        rect.layer.cornerRadius = 10
        rect.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        rect.backgroundColor = .rtsemiblack
        return rect
    }()
    
    private lazy var modalTitle: UILabel = {
        let label = UILabel()
        label.text = "STOCK FILTER"
        label.textColor = .white
        return label
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .rtorange
        button.addTarget(self, action: #selector(handleClose), for: .touchUpInside)
        return button
    }()
    
    private lazy var clearFilterButton: UIButton = {
        let button = UIButton()
        button.setTitle("CLEAR FILTER", for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: 14)
        button.setTitleColor(.rtorange, for: .normal)
        button.addTarget(self, action: #selector(handleClearFilter), for: .touchUpInside)
        return button
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "You can add a maximum of 10 stocks"
        label.font = .italicSystemFont(ofSize: 12)
        label.textColor = .systemGray
        return label
    }()
    
    internal lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 40)
        return layout
    }()
    
    internal lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var applyFilterButton: UIButton = {
        let button = UIButton()
        button.setTitle("APPLY", for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleApplyFilter), for: .touchUpInside)
        button.backgroundColor = .rtorange
        button.layer.cornerRadius = 8
        return button
    }()
    
    // MARK: - Lifecycle
    init(filters: [String]) {
        self.filters = filters
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Selectors
    @objc func handleClose() {
        self.dismiss(animated: true)
    }
    
    @objc func handleClearFilter() {
        filters.removeAll()
        collectionView.reloadData()
    }
    
    @objc func handleApplyFilter() {
        delegate?.addFilter(filters: filters)
        self.dismiss(animated: true)
    }
    
    // MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .rtsemiblack
        
        view.addSubview(background)
        background.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.height / 2)
        }
        
        view.addSubview(modalTitle)
        modalTitle.snp.makeConstraints { make in
            make.top.equalTo(background.snp.top).offset(20)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(closeButton)
        closeButton.snp.makeConstraints { make in
            make.top.equalTo(background.snp.top).offset(20)
            make.right.equalTo(background.snp.right).inset(20)
        }
        
        view.addSubview(clearFilterButton)
        clearFilterButton.snp.makeConstraints { make in
            make.top.equalTo(modalTitle.snp.bottom).offset(50)
            make.left.equalTo(background.snp.left).offset(20)
        }
        
        view.addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
            make.top.equalTo(clearFilterButton.snp.bottom).offset(10)
            make.left.equalTo(background.snp.left).offset(20)
        }
        
        configureCollectionView()
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(textLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(view.frame.width).inset(20)
            make.bottom.equalTo(background.snp.bottom).inset(80)
        }
        
        view.addSubview(applyFilterButton)
        applyFilterButton.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom)
            make.centerX.equalTo(background.snp.centerX)
            make.width.equalTo(UIScreen.main.bounds.width - 40)
        }
    }
    
    func configureCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        // collection item size
        layout.itemSize = CGSize(width: 100, height: 40)
        // set the frame and layout
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        
        collectionView.register(StockFilterCell.self, forCellWithReuseIdentifier: StockFilterCell.identifier)
        collectionView.register(StockAddCell.self, forCellWithReuseIdentifier: StockAddCell.identifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension StockFilterView: StockFilterViewDelegate {
    func addFilter(stockName: String) {
        filters.append(stockName)
        filters = filters.uniqueArrItems()
        collectionView.reloadData()
    }
    
    func deleteFilter(stockName: String) {
        self.filters = filters.filter { $0 != stockName }
        collectionView.reloadData()
    }
}


protocol StockFilterViewDelegate: AnyObject {
    func addFilter(stockName: String)
    func deleteFilter(stockName: String)
}
