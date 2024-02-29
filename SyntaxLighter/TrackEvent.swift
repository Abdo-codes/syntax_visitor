//
//  TrackEvent.swift
//  SyntaxLighter
//
//  Created by Abdoelrahman Eaita on 26/02/2024.
//

import Foundation

struct TrackEvent {
    var fileName: String
    var category: String
    var action: String
    var label: String
    var value: String
    var customDimensions: String
    
    var csvLine: String {
        let escape = { (field: String) -> String in
            "\"\(field.replacingOccurrences(of: "\"", with: "\"\""))\""
        }
        return [escape(fileName), escape(category), escape(action), escape(label), escape(value), escape(customDimensions)].joined(separator: ",") + "\n"
    }
}
