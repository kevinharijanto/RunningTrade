//
//  RunningTradeCell.swift
//  RunningTrade
//
//  Created by Kevin Harijanto on 16/11/22.
//

import UIKit
import SnapKit

class RunningTradeCell: UITableViewCell {
    // MARK: - Properties

    static let identifier = "RunningTradeCell"

    var stock: Stock!

    private let stockName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        return label
    }()

    private let stockPrice: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .right
        return label
    }()

    private let stockChange: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .right
        return label
    }()

    private let stockVolume: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .right
        return label
    }()

    private let stockAction: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .left
        return label
    }()

    private let tradeTime: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .right
        return label
    }()

    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle ,reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .rtblack

        contentView.addSubview(stockName)
        stockName.snp.makeConstraints { make in
            make.verticalEdges.equalTo(contentView.snp.verticalEdges).inset(5)
            make.width.equalTo(75)
            make.left.equalTo(10)
        }

        contentView.addSubview(stockPrice)
        stockPrice.snp.makeConstraints { make in
            make.verticalEdges.equalTo(contentView.snp.verticalEdges).inset(5)
            make.width.equalTo(50)
            make.left.equalTo(stockName.snp.right)
        }

        contentView.addSubview(stockChange)
        stockChange.snp.makeConstraints { make in
            make.verticalEdges.equalTo(contentView.snp.verticalEdges).inset(5)
            make.width.equalTo(80)
            make.left.equalTo(stockPrice.snp.right)
        }

        contentView.addSubview(stockVolume)
        stockVolume.snp.makeConstraints { make in
            make.verticalEdges.equalTo(contentView.snp.verticalEdges).inset(5)
            make.width.equalTo(65)
            make.left.equalTo(stockChange.snp.right)
        }

        contentView.addSubview(stockAction)
        stockAction.snp.makeConstraints { make in
            make.verticalEdges.equalTo(contentView.snp.verticalEdges).inset(5)
            make.width.equalTo(25)
            make.left.equalTo(stockVolume.snp.right).offset(10)
        }

        contentView.addSubview(tradeTime)
        tradeTime.snp.makeConstraints { make in
            make.verticalEdges.equalTo(contentView.snp.verticalEdges).inset(5)
            make.width.equalTo(50)
            make.right.equalTo(contentView.snp.right).inset(10)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Helpers
    func configure() {
        stockName.text = stock.stockName
        stockPrice.text = "\(stock.stockPrice.formattedWithSeparator)"
        stockChange.text = stock.stockChange > 0 ? "+\(stock.stockChange)%" : "\(stock.stockChange)%"
        stockVolume.text = "\(stock.stockVolume.formattedWithSeparator)"
        stockAction.text = stock.stockAction
        tradeTime.text = Stock.dateFormatter(date: stock.tradeTime)

        stockName.textColor = textColor(stockChange: stock.stockChange)
        stockPrice.textColor = textColor(stockChange: stock.stockChange)
        stockChange.textColor = textColor(stockChange: stock.stockChange)
        stockVolume.textColor = .white
        stockAction.textColor = actionTextColor(stockAction: stock.stockAction)
        tradeTime.textColor = .white
    }

    func textColor(stockChange: Double) -> UIColor {
        if stockChange > 0 {
            return .rtgreen
        }
        else if stockChange == 0 {
            return .rtorange
        }
        return .rtred
    }

    func actionTextColor(stockAction: String) -> UIColor {
        if stockAction == "BU" {
            return .rtgreen
        } else {
            return .rtred
        }
    }
}
