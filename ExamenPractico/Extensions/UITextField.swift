//
//  UITextField.swift
//  ExamenPractico
//
//  Created by Ricardo Garcia on 20/12/23.
//

import Foundation
import UIKit
private var __maxLengths = [UITextField: Int]()


extension UITextField {
    @IBInspectable var maxLength: Int {
        get {
            guard let l = __maxLengths[self] else {
               return 150 // (global default-limit. or just, Int.max)
            }
            return l
        }
        set {
            __maxLengths[self] = newValue
            addTarget(self, action: #selector(fix), for: .editingChanged)
        }
    }
    @objc func fix(textField: UITextField) {
        
        if let t = textField.text{
            textField.text = t.prefix(maxLength).description
        }
    }

}



@available(iOS 13.0, *)
class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
            }
        }
    }
}
