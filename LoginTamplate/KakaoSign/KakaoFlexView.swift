//
//  KakaoFlexView.swift
//  LoginTamplate
//
//  Created by JehyeongPark on 10/25/24.
//

import Foundation
import UIKit
import FlexLayout
import PinLayout

class KakaoFlexView: UIView {
    
    fileprivate let rootFlexContainer = UIView()
    fileprivate let subView = UIView()
    
    let hoduLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIApplication.shared.icon
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "간편 로그인"
        label.font = .systemFont(ofSize: .init(19))
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    let label2: UILabel = {
        let label = UILabel()
        label.text = "로그인이 필요합니다."
        label.font = .systemFont(ofSize: .init(16))
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    let kakaoTalkLoginButton: UIButton = {
        let button = UIButton()
        button.setTitle("카카오톡으로 간편 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .kakao
        button.layer.cornerRadius = 10
        return button
    }()
    
    let kakaoDiferentLoginButton: UIButton = {
        let button = UIButton()
        button.setTitle("다른 카카오계정으로 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .kakao
        button.layer.cornerRadius = 10
        return button
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("취소", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .black.withAlphaComponent(0.3)
        
        rootFlexContainer.backgroundColor = .white
        rootFlexContainer.layer.cornerRadius = 10
        
        rootFlexContainer.flex.direction(.column).define { flex in
            
            flex.addItem(hoduLogo).alignSelf(.center)
            flex.addItem(loginLabel).marginTop(16).height(44)
            flex.addItem(label2).marginTop(8).height(44)
            
            flex.direction(.column).justifyContent(.center).define { buttonFlex in
                buttonFlex.addItem(kakaoTalkLoginButton).height(60)
                buttonFlex.addItem(kakaoDiferentLoginButton).marginTop(16).height(60)
            }
            
            flex.addItem(cancelButton).marginTop(16).height(44)
            
        }
        
        addSubview(rootFlexContainer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        rootFlexContainer.pin
            .vCenter()
            .hCenter()
            .height(500)
            .width(311)
        rootFlexContainer.flex.layout()
    }
}
