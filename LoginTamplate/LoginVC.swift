//
//  LoginVC.swift
//  LoginTamplate
//
//  Created by 박제형 on 10/15/24.
//

import Foundation
import FlexLayout
import PinLayout

class LoginVC: UIViewController {
    
    fileprivate let myFlexView = LoginFlexView()
    
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func loadView() {
        view = myFlexView
        
    }
}



