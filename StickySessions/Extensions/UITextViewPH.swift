//
//  UITextViewPH.swift
//  StickySessions
//
//  Created by Vinicius Albuquerque on 14/11/20.
//  Copyright © 2020 CESAR. All rights reserved.
//

import UIKit

class UITextViewPH: UITextView, UITextViewDelegate {
    
    var isPlaceholderShowing = true
    private var placeholderDefaultText = "Add text here"
    @IBInspectable var placeholder: String = "" {
        didSet {
            showPlaceholder()
        }
    }
    
    override var text: String! {
        get {
            if isPlaceholderShowing {
                return ""
            }
            return super.text
        }
        set {
            super.text = newValue
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        delegate = self
        setupView()
        showPlaceholder()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if isPlaceholderShowing {
            hidePlaceholder()
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if super.text.isEmpty {
            showPlaceholder()
        }
    }
    
    private func setupView() {
        super.backgroundColor = UIColor.white
    }
    
    private func showPlaceholder() {
        if (placeholder.isEmpty) {
            super.text = placeholderDefaultText
        } else {
            super.text = placeholder
        }

        super.textColor = UIColor.gray
        isPlaceholderShowing = true
    }
    
    private func hidePlaceholder() {
        super.text = ""
        super.textColor = nil
        isPlaceholderShowing = false
    }
    
}
