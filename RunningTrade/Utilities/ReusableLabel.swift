//
//  ReusableLabel.swift
//  RunningTrade
//
//  Created by Kevin Harijanto on 17/11/22.
//

import UIKit

class ReusableLabel: UILabel {

    //MARK: - Initializers
    public private(set) var alignment: NSTextAlignment
    public internal(set) var color: UIColor
    public private(set) var textString: String
    
    init(alignment: NSTextAlignment,color: UIColor, textString: String) {
        self.alignment = alignment
        self.color = color
        self.textString = textString
        
        super.init(frame: .zero)
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLabel() {
        
        configureLabelText()
        configureLabelStyle()
    }
    
    private func configureLabelText() {
        self.text = textString
    }
    
    //MARK: - Methods
    private func configureLabelStyle() {
        self.font = .systemFont(ofSize: 12)
        self.textAlignment = alignment
        self.textColor = color
    }
}
