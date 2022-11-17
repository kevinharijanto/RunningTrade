//
//  FooterView.swift
//  RunningTrade
//
//  Created by Kevin Harijanto on 17/11/22.
//

import UIKit

class FooterView: UITableViewHeaderFooterView {
    
    static let identifier = "FooterView"
    
    var isEnabled: Bool!
    var filtersArray: [String] = []
    weak var delegate: RunningTradeViewDelegate?
    
    private lazy var filterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Filter", for: .normal)
        button.setTitleColor(.rtorange, for: .normal)
        button.addTarget(self, action: #selector(handleFilter), for: .touchUpInside)
        return button
    }()
    
    private lazy var verticalLine: UIView = {
        let line = UIView()
        line.backgroundColor = .rtgray
        return line
    }()
    
    private lazy var toggleFilter: UISwitch = {
        let toggle = UISwitch()
        toggle.addTarget(self, action: #selector(self.switchStateDidChange(_:)), for: .valueChanged)
        toggle.onTintColor = .rtorange
        return toggle
    }()
    
    // MARK: - Lifecycle
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selector
    @objc func handleFilter() {
        // delegate filter data
        delegate?.showModal()
    }
    
    @objc func switchStateDidChange(_ sender:UISwitch!) {
        if (sender.isOn == true){
            if filtersArray.isEmpty {
                // Show alert that user must fill filter
                print("Filter is Nil")
            } else {
                delegate?.enableFilter()
            }
        }
        else{
            delegate?.disableFilter()
        }
    }
    
    // MARK: - Helpers
    func configure() {
        toggleFilter.setOn(isEnabled, animated: true)
    }
    
    private func configureUI() {
        contentView.backgroundColor = .rtsemiblack
        
        contentView.addSubview(filterButton)
        filterButton.snp.makeConstraints { make in
            make.verticalEdges.equalTo(contentView.snp.verticalEdges).inset(5)
            make.left.equalToSuperview().offset(20)
        }
        
        contentView.addSubview(verticalLine)
        verticalLine.snp.makeConstraints { make in
            make.center.equalTo(contentView.snp.center)
            make.verticalEdges.equalTo(contentView.snp.verticalEdges).inset(10)
            make.width.equalTo(2)
        }
        
        contentView.addSubview(toggleFilter)
        toggleFilter.snp.makeConstraints { make in
            make.centerY.equalTo(contentView.snp.centerY)
            make.right.equalToSuperview().inset(20)
        }
    }
}

