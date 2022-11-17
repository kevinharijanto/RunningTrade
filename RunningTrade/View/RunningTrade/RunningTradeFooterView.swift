//
//  RunningTradeFooterView.swift
//  RunningTrade
//
//  Created by Kevin Harijanto on 16/11/22.
//

import UIKit
import SnapKit

class RunningTradeFooterView: UIView {
    
    // MARK: - Properties
    
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
    required init() {
        super.init(frame: .zero)
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
        }
        else{
            // disable filter, delegate ke view awal
        }
    }
    
    // MARK: - Helpers
    private func configureUI() {
        self.backgroundColor = .rtsemiblack
        self.addSubview(filterButton)
        filterButton.snp.makeConstraints { make in
            make.verticalEdges.equalTo(self.snp.verticalEdges).inset(5)
            make.left.equalToSuperview().offset(20)
        }
        
        self.addSubview(verticalLine)
        verticalLine.snp.makeConstraints { make in
            make.center.equalTo(self.snp.center)
            make.verticalEdges.equalTo(self.snp.verticalEdges).inset(10)
            make.width.equalTo(2)
        }
        
        self.addSubview(toggleFilter)
        toggleFilter.snp.makeConstraints { make in
            make.verticalEdges.equalTo(self.snp.verticalEdges).inset(5)
            make.right.equalToSuperview().inset(20)
        }
    }
}
