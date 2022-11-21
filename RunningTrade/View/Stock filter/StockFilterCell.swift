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
    
    private lazy var background: UIView = {
        let rect = UIView()
        rect.backgroundColor = .rtgray
        rect.layer.cornerRadius = 5
        return rect
    }()
    
    private lazy var stockLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .white
        return label
    }()
    
    private lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.imageView?.layer.transform = CATransform3DMakeScale(0.8, 0.8, 0.8)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleDelete), for: .touchUpInside)
        return button
    }()
    
    

    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.backgroundColor = UIColor.rtgray.cgColor
        layer.cornerRadius = frame.height / 4
        layer.borderWidth = 1
        layer.borderColor = UIColor.rtorange.cgColor
        
        contentView.addSubview(stockLabel)
        stockLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.bottom.equalTo(contentView.snp.bottom).inset(10)
            
            make.left.equalTo(contentView.snp.left).offset(10)
            make.width.equalTo(70)
//            make.leading.equalTo(contentView.snp.leading).offset(10)
        }

        contentView.addSubview(deleteButton)
        deleteButton.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.bottom.equalTo(contentView.snp.bottom).inset(10)
            
            make.left.equalTo(stockLabel.snp.right)
            make.right.equalTo(contentView.snp.right)
            make.width.equalTo(20)
//            make.leading.equalTo(stockLabel.snp.trailing)
//            make.trailing.equalTo(contentView.snp.trailing).inset(10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let targetSize = CGSize(width: layoutAttributes.frame.width, height: 0)
        layoutAttributes.frame.size = contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
        return layoutAttributes
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
