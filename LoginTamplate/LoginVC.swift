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
        
        myFlexView.count.text = "\(count)"
        myFlexView.plusButton.addTarget(self, action: #selector(plusCount(_:)), for: .touchUpInside)
        myFlexView.subtractButton.addTarget(self, action: #selector(subtractCount(_:)), for: .touchUpInside)
    }
    
    @objc func plusCount(_ sender: UIButton) {
        count += 1
        myFlexView.count.text = "\(count)"
    }
    
    @objc func subtractCount(_ sender: UIButton) {
        count -= 1
        myFlexView.count.text = "\(count)"
    }
}



