//
//  StockAddCell.swift
//  RunningTrade
//
//  Created by Kevin Harijanto on 17/11/22.
//

import UIKit
import SnapKit

class StockAddCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "StockAddCell"
    weak var delegate: StockFilterViewDelegate?
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add Stock", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.setTitleColor(.rtorange, for: .normal)
        
        button.menu = menu
        button.showsMenuAsPrimaryAction = true
        return button
    }()
    
    private lazy var menu = UIMenu(title: "Stock Filter", children: elements)
    private lazy var wege = UIAction(title: "WEGE", attributes: [],state: .off) {action in
        self.delegate?.addFilter(stockName: "WEGE")
    }
    private lazy var digi = UIAction(title: "DIGI", attributes: [],state: .off) {action in
        self.delegate?.addFilter(stockName: "DIGI")
    }
    private lazy var kras = UIAction(title: "KRAS", attributes: [],state: .off) {action in
        self.delegate?.addFilter(stockName: "KRAS")
    }
    private lazy var sico = UIAction(title: "SICO", attributes: [],state: .off) {action in
        self.delegate?.addFilter(stockName: "SICO")
    }
    private lazy var bcap = UIAction(title: "BCAP", attributes: [],state: .off) {action in
        self.delegate?.addFilter(stockName: "BCAP")
    }
    private lazy var bbni = UIAction(title: "BBNI", attributes: [],state: .off) {action in
        self.delegate?.addFilter(stockName: "BBNI")
    }
    private lazy var fren = UIAction(title: "FREN", attributes: [],state: .off) {action in
        self.delegate?.addFilter(stockName: "FREN")
    }
    private lazy var elements: [UIAction] = [wege,digi,kras,sico,bcap,bbni,fren]

    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.backgroundColor = UIColor.rtsemiblack.cgColor
        layer.cornerRadius = frame.height / 4
        layer.borderWidth = 1
        layer.borderColor = UIColor.rtorange.cgColor

        contentView.addSubview(addButton)
        addButton.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.bottom.equalTo(contentView.snp.bottom).inset(10)
            make.leading.equalTo(contentView.snp.leading).offset(10)
            make.trailing.equalTo(contentView.snp.trailing).inset(10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
