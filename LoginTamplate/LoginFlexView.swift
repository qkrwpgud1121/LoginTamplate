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
    
    private let id: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 19)
        return textField
    }()
    
    private let password: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 19)
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 19)
        button.backgroundColor = .blue
        return button
    }()
    
    private let orLabel: UILabel = {
        let label = UILabel()
        label.text = "or"
        label.font = UIFont.systemFont(ofSize: 19)
        label.textAlignment = .center
        return label
    }()
    
    private let sectorLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .lightGray
        return label
    }()
    
    private let sectorLabel2: UILabel = {
        let label = UILabel()
        label.backgroundColor = .lightGray
        return label
    }()
    
    let googleSignInButton: UIButton = {
        let button = UIButton()
        button.setTitle(" Sign in with Google", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 19)
        button.backgroundColor = .white
        button.setImage(UIImage(named: "google_logo")?.resize(to: .init(width: 20, height: 20)), for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.cornerRadius = 22
        return button
    }()
    
    let appleSignInButton: UIButton = {
        let button = UIButton()
        button.setTitle(" Sign in with Apple", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 19)
        button.backgroundColor = .black
        button.setImage(UIImage(systemName: "applelogo"), for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 22
        return button
    }()
    
    let kakaoSignInButton: UIButton = {
        let button = UIButton()
        button.setTitle(" Sign in with Kakao", for: .normal)
        button.setTitleColor(.kakaoBrown, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 19)
        button.backgroundColor = .kakao
        button.setImage(UIImage(named: "Kakao_logo")?.resize(to: .init(width: 20, height: 20)), for: .normal)
        button.layer.cornerRadius = 22
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        
        id.placeholder = "Enter your id"
        password.placeholder = "Enter your password"
        
        rootFlexContainer.flex.direction(.column).padding(16).define { flex in
            
            flex.addItem(id).height(44)
            flex.addItem(password).marginTop(16).height(44)
            flex.addItem(loginButton).marginTop(16).height(44)
            
            flex.addItem().direction(.row).justifyContent(.spaceBetween).marginTop(16).define { sector in
                sector.addItem(sectorLabel).grow(3).height(1).alignSelf(.center)
                sector.addItem(orLabel).grow(1)
                sector.addItem(sectorLabel2).grow(3).height(1).alignSelf(.center)
            }
            
            flex.addItem(googleSignInButton).marginTop(16).height(44)
            flex.addItem(appleSignInButton).marginTop(16).height(44)
            flex.addItem(kakaoSignInButton).marginTop(16).height(44)
            
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


