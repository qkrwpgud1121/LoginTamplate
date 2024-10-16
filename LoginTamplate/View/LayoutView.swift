//
//  LayoutView.swift
//  LoginTamplate
//
//  Created by 박제형 on 10/16/24.
//

import Foundation
import UIKit
import FlexLayout
import PinLayout

class LayoutView: UIView {
    
    fileprivate let rootFlexContainer = UIView()
    
    let idLabel = UILabel()
    let idTextField = UITextField()
    
    let pwdLabel = UILabel()
    let pwdTextField = UITextField()
    
    let loginButton = UIButton()
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
