//
//  StockFilterView.swift
//  RunningTrade
//
//  Created by Kevin Harijanto on 17/11/22.
//

import UIKit

class StockFilterView: UIViewController {
    // MARK: - Properties
    var filters: [String]
    weak var delegate: RunningTradeViewDelegate?
    
    private lazy var background: UIView = {
        let rect = UIView()
        rect.setDimensions(height: UIScreen.main.bounds.height / 2, width: UIScreen.main.bounds.width)
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
        button.setDimensions(height: 36, width: UIScreen.main.bounds.width - 40)
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
        
        view.addSubview(background)
        background.anchor(left: view.leftAnchor, bottom: view.bottomAnchor)
        
        view.addSubview(modalTitle)
        modalTitle.anchor(top: background.topAnchor, paddingTop: 20)
        modalTitle.centerX(inView: view)
        
        view.addSubview(closeButton)
        closeButton.anchor(top: background.topAnchor, right: view.rightAnchor, paddingTop: 20, paddingRight: 20)
        
        view.addSubview(clearFilterButton)
        clearFilterButton.anchor(top: modalTitle.bottomAnchor, left: view.leftAnchor,paddingTop: 50, paddingLeft: 20)
        
        view.addSubview(textLabel)
        textLabel.anchor(top: clearFilterButton.bottomAnchor, left: view.leftAnchor,paddingTop: 10, paddingLeft: 20)
        
        configureCollectionView()
        view.addSubview(collectionView)
        collectionView.anchor(top: textLabel.bottomAnchor,
                              left: background.leftAnchor,
                              bottom: background.bottomAnchor,
                              paddingTop: 10,
                              paddingLeft: 20,
                              paddingBottom: 80,
                              width: view.frame.width - 20)
        
        view.addSubview(applyFilterButton)
        applyFilterButton.anchor(top: collectionView.bottomAnchor)
        applyFilterButton.centerX(inView: background)
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
