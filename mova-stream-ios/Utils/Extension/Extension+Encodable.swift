//
//  Extension+Encodable.swift
//  mova-stream-ios
//
//  Created by HAU NGUYEN on 20/6/25.
//

import Foundation

extension Encodable {
    var jsonDict: [String: Any]? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        do {
            let data = try encoder.encode(self)
            let jsonDict = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]
            return jsonDict
        } catch {
            print("error converting to dict, \(error)")
            return nil
        }
    }
    
    
    func jsonString(prettify: Bool = false) -> String? {
        guard JSONSerialization.isValidJSONObject(self) else { return nil }
        let options = (prettify == true) ? JSONSerialization.WritingOptions.prettyPrinted : JSONSerialization.WritingOptions()
        guard let jsonData = try? JSONSerialization.data(withJSONObject: self, options: options) else { return nil }
        return String(data: jsonData, encoding: .utf8)
    }
}
