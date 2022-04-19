//
//  ViewController.swift
//  Anti-screenshot
//
//  Created by iya on 2022/4/19.
//

import UIKit

class ViewController: UIViewController {
    
    private let label = UILabel()
    
    override func loadView() {
        self.view = UIView.createSecrect()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
        label.text = "SECRECT\nTEXT"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 68)
        label.sizeToFit()
        // Do any additional setup after loading the view.
        
        view.addSubview(label)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.center = view.center
    }
}

extension UIView {
    
    static func createSecrect() -> UIView {
        let className = NSString(format: "_UI%@Can%@ew", "TextLayout", "vasVi") as String
        guard let cls = NSClassFromString(className),
              let viewType = cls as? UIView.Type else {
            return fallbackCreateSecrect()
        }
        let view = viewType.init()
        view.isUserInteractionEnabled = true
        return view
    }
    
    private static func fallbackCreateSecrect() -> UIView {
        let textField = UITextField()
        textField.isSecureTextEntry = true
        guard let view = textField.subviews.first else {
            return UIView()
        }
        view.subviews.forEach { $0.removeFromSuperview() }
        view.isUserInteractionEnabled = true
        return view
    }
}
