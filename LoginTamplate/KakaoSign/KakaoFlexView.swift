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
    
    let hoduLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIApplication.shared.icon
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "간편 로그인"
        label.font = .systemFont(ofSize: .init(16))
        label.textColor = .black
        return label
    }()
    
    let label2: UILabel = {
        let label = UILabel()
        label.text = "로그인이 필요합니다."
        label.font = .systemFont(ofSize: .init(12))
        label.textColor = .black
        return label
    }()
    
    let kakaoTalkLoginButton: UIButton = {
        let button = UIButton()
        button.setTitle("카카오톡으로 간편 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .kakao
        return button
    }()
    
    let kakaoDiferentLoginButton: UIButton = {
        let button = UIButton()
        button.setTitle("다른 카카오계정으로 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .kakao
        return button
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("취소", for: .normal)
        button.backgroundColor = .black
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        
        rootFlexContainer.flex.direction(.column).padding(16).define { flex in
            
            flex.addItem(hoduLogo).alignSelf(.center)
            flex.addItem(cancelButton).marginTop(16).height(44)
        }
        
        addSubview(rootFlexContainer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        rootFlexContainer.pin.all(pin.safeArea)
        rootFlexContainer.flex.layout(mode: .adjustHeight)
    }
}
