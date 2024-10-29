//
//  KakaoSignIn.swift
//  LoginTamplate
//
//  Created by 박제형 on 10/22/24.
//

import Foundation
import FlexLayout
import PinLayout
import KakaoSDKUser

class KakaoSignIn: UIViewController {
    
    fileprivate let kakaoFlexView = KakaoFlexView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func loadView() {
        view = kakaoFlexView
        
        kakaoFlexView.kakaoTalkLoginButton.addTarget(self, action: #selector(kakaoTalkLoginButtonTapped(_:)), for: .touchUpInside)
        kakaoFlexView.kakaoDiferentLoginButton.addTarget(self, action: #selector(kakaoAccountLoginButtonTapped(_:)), for: .touchUpInside)
        kakaoFlexView.cancelButton.addTarget(self, action: #selector(cancelButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc func kakaoTalkLoginButtonTapped(_ sender: UIButton) {
        
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk { oauthToken, error in
                if let error = error {
                    print(error)
                } else {
                    print("loginWithKakaoTalk() success.")
                    _ = oauthToken
                    
                    let userToken = oauthToken?.accessToken
                    
                    print("====> token: \(userToken)")
                    
                }
            }
        }
    }
    
    @objc func kakaoAccountLoginButtonTapped(_ sender: UIButton) {
        
        UserApi.shared.loginWithKakaoAccount { oauthToken, error in
            if let error = error {
                print(error)
            } else {
                print("loginWithKakaoAccount() success.")
                _ = oauthToken
                
                let userToken = oauthToken?.accessToken
                
                print("====> token: \(userToken)")
            }
        }
    }
    
    @objc func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
