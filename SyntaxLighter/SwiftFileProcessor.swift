import Foundation

// Encapsulates the logic for parsing Swift syntax files
struct SwiftFileProcessor {
    let path: String
    
    func process() {
        var isDirectory: ObjCBool = false
        FileManager.default.fileExists(atPath: path, isDirectory: &isDirectory)
        
        if isDirectory.boolValue {
            processDirectory(atPath: path)
        } else {
            processFile(atPath: path)
        }
    }
    
    private func processDirectory(atPath path: String) {
        guard let enumerator = FileManager.default.enumerator(atPath: path) else {
            print("Could not enumerate files in directory: \(path)")
            return
        }
        
        for case let filename as String in enumerator where filename.hasSuffix(".swift") {
            let fullPath = (path as NSString).appendingPathComponent(filename)
            processFile(atPath: fullPath)
        }
    }
    
    private func processFile(atPath path: String) {
        do {
            let source = try String(contentsOfFile: path, encoding: .utf8)
            let parser = SyntaxFileParser(
                source: source,
                fileName: URL(fileURLWithPath: path).lastPathComponent
            )
            try parser.parse()
        } catch {
            print("Failed to read file at \(path): \(error)")
        }
    }
}
