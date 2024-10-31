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
        
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.email, .fullName]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
        
        print("appleSignIn")
    }
    
    @objc func kakaoSignIn(_ sender: UIButton) {
        
        let kakaoSignVC = KakaoSignIn()
        kakaoSignVC.modalPresentationStyle = .overCurrentContext
        kakaoSignVC.modalTransitionStyle = .crossDissolve
        
        self.present(kakaoSignVC, animated: true)
    }
}

extension LoginVC: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        
        switch authorization.credential {
        case let appleIdCreential as ASAuthorizationAppleIDCredential:
            
            let userIdentifier = appleIdCreential.user
            let fullName = appleIdCreential.fullName
            let email = appleIdCreential.email
            
            print("User Identifier: \(userIdentifier)")
            print("Full Name: \(String(describing: fullName))")
            print("Email: \(email ?? "")")
            
        case let passwordCredential as ASPasswordCredential:
            
            let userName = passwordCredential.user
            let password = passwordCredential.password
            
            print("User Name: \(userName)")
            print("Password: \(password)")
        default:
            break
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: any Error) {
        print("login failed - \(error.localizedDescription)")
    }
}

