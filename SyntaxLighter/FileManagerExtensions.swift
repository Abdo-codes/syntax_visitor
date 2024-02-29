//
//  FileManagerExtensions.swift
//  SyntaxLighter
//
//  Created by Abdoelrahman Eaita on 26/02/2024.
//

import Foundation

struct FileManagerExtensions {
    static let shared = FileManager.default
    
    static func createDirectoryIfNeeded(at url: URL) throws {
        try shared.createDirectory(at: url, withIntermediateDirectories: true)
    }
    
    static func fileExists(atPath path: String) -> Bool {
        return shared.fileExists(atPath: path)
    }
}

enum FileError: Error {
    case directoryNotFound
}
