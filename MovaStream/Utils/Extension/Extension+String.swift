//
//  Extension+String.swift
//  Mova
//
//  Created by HauNguyen on 08/12/2565 BE.
//

import UIKit

public extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
