//
//  SectionSubTitleButton.swift
//  mova-stream-ios
//
//  Created by HAU NGUYEN on 20/6/25.
//

import UIKit

@IBDesignable
final class SectionSubTitleButton: UIButton {
    
    // MARK: - Font Customization
    
    private func commonConfig() {
        self.setTitleColor(.mainColor, for: .normal)
        self.isEnabled = true
    }
    
    // MARK: - Font Customization
    
    @IBInspectable var fontSize: CGFloat = 14 {
        didSet {
            updateFont()
        }
    }
    
    @IBInspectable var fontName: String = "" {
        didSet {
            updateFont()
        }
    }
    
    private func updateFont() {
        guard let titleLabel = titleLabel else { return }
        if let customFont = UIFont(name: fontName, size: fontSize), !fontName.isEmpty {
            titleLabel.font = customFont
        } else {
            titleLabel.font = UIFont.systemFont(ofSize: fontSize, weight: .semibold)
        }
    }

    // MARK: - Init

    override func awakeFromNib() {
        super.awakeFromNib()
        updateFont()
        commonConfig()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        updateFont()
        commonConfig()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateFont()
        commonConfig()
    }
}
