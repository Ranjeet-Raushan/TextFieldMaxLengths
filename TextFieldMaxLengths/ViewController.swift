//  ViewController.swift
//  TextFieldMaxLengths
//  Created by Ranjeet Raushan on 14/01/19.
//  Copyright © 2019 vaayoo. All rights reserved.

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var fname: UITextField!
    @IBOutlet weak var scndName: UITextField!
    @IBOutlet weak var dob: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}
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
        let t = textField.text
        textField.text = t?.safelyLimitedTo(length: maxLength)
    }
}

extension String
{
    func safelyLimitedTo(length n: Int)->String {
        if (self.count <= n) {
            return self
        }
        return String( Array(self).prefix(upTo: n) )
    }
}


