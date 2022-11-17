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
//    var filtersArray: [String]
    weak var delegate: RunningTradeViewDelegate?
    
    private lazy var filterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Filter", for: .normal)
        button.setTitleColor(.white, for: .normal)
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
            // if filters empty, alert utk isi filter
//            if filtersArray.isEmpty {
//                print("Ih Kosong!")
//            } else {
                delegate?.enableFilter()
//            }
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
//        backgroundColor = .rtsemiblack
        contentView.addSubview(filterButton)
        filterButton.anchor(top: contentView.topAnchor,
                            left: contentView.leftAnchor,
                            paddingTop: 10,
                            paddingLeft: 10)
//        filterButton.snp.makeConstraints { make in
//            make.verticalEdges.equalTo(contentView.snp.verticalEdges).inset(5)
//            make.left.equalToSuperview().offset(20)
//        }
        
        contentView.addSubview(verticalLine)
        verticalLine.centerX(inView: contentView)
        verticalLine.centerY(inView: contentView)
        verticalLine.setDimensions(height: 40, width: 2)
//        verticalLine.snp.makeConstraints { make in
//            make.center.equalTo(contentView.snp.center)
//            make.verticalEdges.equalTo(contentView.snp.verticalEdges).inset(10)
//            make.width.equalTo(2)
//        }
        
        contentView.addSubview(toggleFilter)
        toggleFilter.anchor(top: contentView.topAnchor,
                            right: contentView.rightAnchor,
                            paddingTop: 10,
                            paddingRight: 10)
//        toggleFilter.snp.makeConstraints { make in
//            make.verticalEdges.equalTo(contentView.snp.verticalEdges).inset(5)
//            make.right.equalToSuperview().inset(20)
//        }
    }
}

