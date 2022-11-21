//
//  IHSGView.swift
//  RunningTrade
//
//  Created by Kevin Harijanto on 20/11/22.
//

import UIKit
import SnapKit

class IHSGView: UIView {
    
    // MARK: - Properties
    private lazy var ihsgLabel: UILabel = {
        let label = UILabel()
        label.text = "7208.36"
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var changeLabel: UILabel = {
        let label = UILabel()
        label.text = "+76.32(+1.07%)"
        label.textColor = .rtgreen
        label.font = .systemFont(ofSize: 10)
        return label
    }()
    
    // MARK: - Lifecycle
    required init() {
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    private func configureUI() {
        self.backgroundColor = .rtblue
        
        self.addSubview(ihsgLabel)
        ihsgLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.trailing.equalTo(self.snp.trailing)
        }
        
        self.addSubview(changeLabel)
        changeLabel.snp.makeConstraints { make in
            make.top.equalTo(ihsgLabel.snp.bottom)
            make.bottom.equalTo(self.snp.bottom)
            make.trailing.equalTo(self.snp.trailing)
        }
    }
    
}
