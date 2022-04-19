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
        let asciis: [UInt8] = [
            95, 85, 73, 84, 101, 120, 116, 76, 97, 121, 111, 117,
            116, 67, 97, 110, 118, 97, 115, 86, 105, 101, 119
        ]
        let className = asciis.reduce("") { $0 + "\(Character(UnicodeScalar($1)))" }
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

extension Character {
    
    var ascii: UInt32 {
        var value: UInt32 = 0
        for s in unicodeScalars {
            value = s.value
        }
        return value
    }
}
