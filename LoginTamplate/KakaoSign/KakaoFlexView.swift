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
        imageView.contentMode = .scaleAspectFit
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
    
    let kakaoTalkLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Kakao_logo")?.resize(to: .init(width: 20, height: 20))
        imageView.contentMode = .center
        return imageView
    }()
    
    let kakaoTalkDivLable1: UILabel = {
        let label = UILabel()
        label.backgroundColor = .black.withAlphaComponent(0.2)
        label.layer.cornerRadius = 0.5
        return label
    }()
    
    let kakaoTalkLoginButton: UIButton = {
        let button = UIButton()
        button.setTitle("카카오톡으로 간편 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let kakaoAccountLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "kakao_Account")?.resize(to: .init(width: 20, height: 20))
        imageView.contentMode = .center
        return imageView
    }()
    
    let kakaoTalkDivLable2: UILabel = {
        let label = UILabel()
        label.backgroundColor = .black.withAlphaComponent(0.2)
        label.layer.cornerRadius = 0.5
        return label
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
        
        rootFlexContainer.flex.direction(.column).justifyContent(.spaceAround).define { flex in
            
            flex.addItem().direction(.column).alignItems(.center).define { flex in
                
                flex.addItem(hoduLogo).cornerRadius(10)
                flex.addItem(loginLabel).marginTop(16)
                flex.addItem(label2).marginTop(16)
            }
            
            flex.addItem().direction(.column).margin(16).define { flex in
                
                flex.addItem().direction(.row).alignItems(.center).backgroundColor(.kakao).cornerRadius(10).define { flex in
                    
                    flex.addItem(kakaoTalkLogo).width(60)
                    flex.addItem(kakaoTalkDivLable1).height(30).width(1)
                    flex.addItem(kakaoTalkLoginButton).marginLeft(10).height(60)
                }
                
                flex.addItem().direction(.row).alignItems(.center).backgroundColor(.kakao).marginTop(16).cornerRadius(10).define { flex in
                    
                    flex.addItem(kakaoAccountLogo).width(60)
                    flex.addItem(kakaoTalkDivLable2).height(30).width(1)
                    flex.addItem(kakaoDiferentLoginButton).marginLeft(10).height(60)
                }
            }
            
            flex.addItem().direction(.column).define { flex in
                flex.addItem(cancelButton)
            }
            
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
