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
    
    private let googleSignInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        var attString = AttributedString("Sign in with Google")
        attString.font = .systemFont(ofSize: 19)
        
        var config = UIButton.Configuration.bordered()
        config.attributedTitle = attString
        config.image = UIImage(named: "Google_logo")?.resize(to: .init(width: 20, height: 20))
        config.imagePadding = 5
        config.baseBackgroundColor = .white
        config.baseForegroundColor = .blue
        config.background.strokeWidth = 1
        config.background.strokeColor = .blue
        config.cornerStyle = .capsule
        
        button.configuration = config
        
        return button
    }()
    
    private let appleSignInButton: UIButton = {
        let button = UIButton()
        button.setTitle(" Sign in with Apple", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 19)
        button.backgroundColor = .black
        button.setImage(UIImage(systemName: "applelogo"), for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 22
        return button
    }()
    
    private let kakaoSignInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        var attString = AttributedString("Sign in with Kakao")
        attString.font = .systemFont(ofSize: 19)
        
        var config = UIButton.Configuration.filled()
        config.attributedTitle = attString
        config.image = UIImage(named: "Kakao_logo")?.resize(to: CGSize(width: 20, height: 20))
        config.imagePadding = 5
        config.baseBackgroundColor = .kakao
        config.baseForegroundColor = .kakaoBrown
        config.cornerStyle = .capsule
        
        button.configuration = config
        
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

extension UIImage {
    func resize(to size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resizedImage ?? self
    }
}
