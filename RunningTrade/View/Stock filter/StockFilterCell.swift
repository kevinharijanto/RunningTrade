//
//  StockFilterCell.swift
//  RunningTrade
//
//  Created by Kevin Harijanto on 17/11/22.
//

import UIKit
import SnapKit

class StockFilterCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "StockFilterCell"
    var stockName: String!
    weak var delegate: StockFilterViewDelegate?
    
    private lazy var stockLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .white
        return label
    }()
    
    private lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleDelete), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.backgroundColor = UIColor.rtgray.cgColor
        layer.cornerRadius = frame.width / 4

        contentView.addSubview(stockLabel)
        stockLabel.snp.makeConstraints { make in
            make.centerX.equalTo(contentView.snp.centerX)
            make.centerY.equalTo(contentView.snp.centerY)
        }
        
        contentView.addSubview(deleteButton)
        deleteButton.snp.makeConstraints { make in
            make.right.equalTo(contentView.snp.right).inset(10)
            make.centerY.equalTo(contentView.snp.centerY)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func handleDelete() {
        delegate?.deleteFilter(stockName: stockName)
    }
    
    
    // MARK: - Helpers
    
    func configure() {
        stockLabel.text = stockName
    }
}
