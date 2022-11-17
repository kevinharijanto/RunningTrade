//
//  RunningTradeHeaderView.swift
//  RunningTrade
//
//  Created by Kevin Harijanto on 16/11/22.
//

import UIKit
import SnapKit

class RunningTradeHeaderView: UIView {
    
    // MARK: - Properties

    
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
        
        let stockName = ReusableLabel(alignment: .left, color: .white, textString: "STOCK")
        let stockPrice = ReusableLabel(alignment: .right, color: .white, textString: "PRICE")
        let stockChange = ReusableLabel(alignment: .right, color: .white, textString: "CHG")
        let stockVolume = ReusableLabel(alignment: .right, color: .white, textString: "VOL")
        let stockAction = ReusableLabel(alignment: .left, color: .white, textString: "ACT")
        let tradeTime = ReusableLabel(alignment: .right, color: .white, textString: "TIME")

        self.addSubview(stockName)
        stockName.snp.makeConstraints { make in
            make.verticalEdges.equalTo(self.snp.verticalEdges).inset(5)
            make.width.equalTo(75)
            make.left.equalTo(10)
        }
        
        self.addSubview(stockPrice)
        stockPrice.snp.makeConstraints { make in
            make.verticalEdges.equalTo(self.snp.verticalEdges).inset(5)
            make.width.equalTo(50)
            make.left.equalTo(stockName.snp.right)
        }
        
        self.addSubview(stockChange)
        stockChange.snp.makeConstraints { make in
            make.verticalEdges.equalTo(self.snp.verticalEdges).inset(5)
            make.width.equalTo(80)
            make.left.equalTo(stockPrice.snp.right)
        }
        
        self.addSubview(stockVolume)
        stockVolume.snp.makeConstraints { make in
            make.verticalEdges.equalTo(self.snp.verticalEdges).inset(5)
            make.width.equalTo(65)
            make.left.equalTo(stockChange.snp.right)
        }
        
        self.addSubview(stockAction)
        stockAction.snp.makeConstraints { make in
            make.verticalEdges.equalTo(self.snp.verticalEdges).inset(5)
            make.width.equalTo(25)
            make.left.equalTo(stockVolume.snp.right).offset(10)
        }
        
        self.addSubview(tradeTime)
        tradeTime.snp.makeConstraints { make in
            make.verticalEdges.equalTo(self.snp.verticalEdges).inset(5)
            make.width.equalTo(50)
            make.right.equalTo(self .snp.right).inset(10)
        }
    }
    
}
