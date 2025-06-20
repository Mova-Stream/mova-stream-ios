//
//  SectionSubTitleLabel.swift
//  mova-stream-ios
//
//  Created by HAU NGUYEN on 20/6/25.
//

import UIKit

@IBDesignable
final class SectionSubTitleLabel: UILabel {
    
    // MARK: - Insets

    @IBInspectable var topInset: CGFloat = 0
    @IBInspectable var bottomInset: CGFloat = 0
    @IBInspectable var leftInset: CGFloat = 0
    @IBInspectable var rightInset: CGFloat = 0

    // MARK: - Font Customization
    
    private func commonConfig() {
        self.textColor = .mainColor
    }

    @IBInspectable var fontSize: CGFloat = 12 {
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
        if let customFont = UIFont(name: fontName, size: fontSize), !fontName.isEmpty {
            font = customFont
        } else {
            font = UIFont.systemFont(ofSize: fontSize, weight: .semibold)
        }
    }

    // MARK: - Layout Overrides

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset,
                                  left: leftInset,
                                  bottom: bottomInset,
                                  right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let adjustedSize = super.sizeThatFits(size)
        return CGSize(width: adjustedSize.width + leftInset + rightInset,
                      height: adjustedSize.height + topInset + bottomInset)
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
