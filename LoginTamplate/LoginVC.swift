//
//  LoginVC.swift
//  LoginTamplate
//
//  Created by 박제형 on 10/15/24.
//

import Foundation
import FlexLayout
import PinLayout
import GoogleSignIn
import AuthenticationServices
import KakaoSDKUser

class LoginVC: UIViewController {
    
    fileprivate let myFlexView = LoginFlexView()
    
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
    }
    
    override func loadView() {
        view = myFlexView
        
        myFlexView.googleSignInButton.addTarget(self, action: #selector(googleSignIn(_:)), for: .touchUpInside)
        myFlexView.appleSignInButton.addTarget(self, action: #selector(appleSignIn(_:)), for: .touchUpInside)
        myFlexView.kakaoSignInButton.addTarget(self, action: #selector(kakaoSignIn(_:)), for: .touchUpInside)
    }
    
    @objc func googleSignIn(_ sender: UIButton) {
        
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { result, error in
            guard error == nil else { return }
            
            let email = result?.user.profile?.email ?? ""
            let name = result?.user.profile?.name ?? ""
            
            print("====> \(email)")
            print("====> \(name)")
        }
    }
    
    @objc func appleSignIn(_ sender: UIButton) {
        print("appleSignIn")
    }
    
    @objc func kakaoSignIn(_ sender: UIButton) {
        
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk { oauthToken, error in
                if let error = error {
                    print("error: \(error)")
                }
            }
        } else {
            self.present(KakaoSignIn(), animated: true)
            print("loginWithKakaoTalk() success")
        }
        
        print("kakaoSignIn")
    }
}

