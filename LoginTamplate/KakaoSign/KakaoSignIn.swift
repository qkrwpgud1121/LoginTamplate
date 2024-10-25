//
//  KakaoSignIn.swift
//  LoginTamplate
//
//  Created by 박제형 on 10/22/24.
//

import Foundation
import FlexLayout
import PinLayout

class KakaoSignIn: UIViewController {
    
    fileprivate let kakaoFlexView = KakaoFlexView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func loadView() {
        view = kakaoFlexView
        
        kakaoFlexView.kakaoTalkLoginButton.addTarget(self, action: #selector(kakaoTalkLoginButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc func kakaoTalkLoginButtonTapped(_ sender: UIButton) {
        print("kakaoTalk")
    }
}
