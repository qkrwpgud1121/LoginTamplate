//
//  LoginFlexView.swift
//  LoginTamplate
//
//  Created by 박제형 on 10/16/24.
//

import UIKit
import FlexLayout
import PinLayout

class LoginFlexView: UIView {
    
    fileprivate let rootFlexContainer = UIView()
    
    let plusButton = UIButton(configuration: .filled())
    let subtractButton = UIButton(configuration: .filled())
    let count = UILabel()
    let footer = UILabel()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        
        plusButton.setTitle("+", for: .normal)
        subtractButton.setTitle("-", for: .normal)
        
        count.textAlignment = .center
        count.font = UIFont.systemFont(ofSize: 60.0)
        
        footer.text = "flexLayout test"
        
        rootFlexContainer.flex.width(100%).direction(.column).padding(12).define { flex in
            
            flex.addItem().direction(.row).justifyContent(.spaceBetween).define { row in
                row.addItem(plusButton).grow(1).marginRight(10)
                row.addItem(subtractButton).grow(1)
            }
            
            flex.addItem(count)
            
            flex.addItem().height(1).marginTop(12).backgroundColor(.lightGray)
            flex.addItem(footer).alignSelf(.center).marginTop(12)
        }
        
        addSubview(rootFlexContainer)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        rootFlexContainer.pin.all(pin.safeArea)
        rootFlexContainer.flex.layout(mode: .adjustHeight)
    }
    
}
