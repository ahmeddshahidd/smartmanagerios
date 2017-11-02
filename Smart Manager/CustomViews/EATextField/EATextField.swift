//
//  EATextField.swift
//  Template
//
//  Created by alijabbar on 3/16/17.
//  Copyright © 2017 Muzamil Hassan. All rights reserved.
//

import UIKit

@IBDesignable class EATextField: UIView {

    @IBOutlet var iconView: UIImageView!
    @IBOutlet var textfield: UITextField!
    
    var contentView : UIView?

    
    enum EAKeyboardType: String {
        case Email = "email" // lowercase to make it case-insensitive
        case Password = "password"
        case Name = "name"
        case PhoneNumber = "phone"
    }

    var keyboardType:EAKeyboardType = EAKeyboardType.Name
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'shape' instead.")
    @IBInspectable var keyType: String? {
        willSet {
            // Ensure user enters a valid shape while making it lowercase.
            // Ignore input if not valid.
            if let newKeyType = EAKeyboardType(rawValue: newValue?.lowercased() ?? "") {
                keyboardType = newKeyType
                
                switch keyboardType {
                case .Email:
                    textfield.keyboardType = .emailAddress
                    break
                case .Password:
                    textfield.keyboardType = .asciiCapable
                    textfield.isSecureTextEntry = true
                    break
                case .PhoneNumber:
                    textfield.keyboardType = .phonePad
                    break
                case .Name:
                    textfield.keyboardType = .namePhonePad
                    break
                }
            }
        }
    }
    
    @IBInspectable var icon_image: UIImage {
        get {
            return iconView.image!
        }
        
        set(image) {
            iconView.image = image
        }
    }
    
    
    @IBInspectable var placeholderString: String {
        
        get {
            return textfield.placeholder!
        }
        
        set(placeholderString) {
            textfield.placeholder = placeholderString
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        contentView = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        contentView!.frame = bounds
        
        // Make the view stretch with containing view
        contentView!.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(contentView!)
    }
    
    func loadViewFromNib() -> UIView! {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    } }
