//
//  SyntaxFileParser.swift
//  SyntaxLighter
//
//  Created by Abdoelrahman Eaita on 26/02/2024.
//

import Foundation
import SwiftSyntax
import SwiftParser

struct SyntaxFileParser {
    var source: String
    var fileName: String
    
    init(source: String, fileName: String) {
        self.source = source
        self.fileName = fileName
    }
    
    func parse() throws {
        let syntax = Parser.parse(source: source)
        let visitor = EventCallSyntaxVisitor(fileName: fileName)
        visitor.walk(syntax)
        
        let outputPath = try CSVExporter.createCSVDirectory().appendingPathComponent("Events.csv").path
        
        try CSVExporter.exportEvents(events: visitor.events, to: outputPath)
    }
}
