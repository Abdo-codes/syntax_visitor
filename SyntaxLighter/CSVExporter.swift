import Foundation

struct CSVExporter {
    static func createCSVDirectory() throws -> URL {
        guard let projectDir = ProcessInfo.processInfo.environment["PROJECT_DIR"] else {
            throw FileError.directoryNotFound
        }
        
        let csvDirectoryURL = URL(fileURLWithPath: projectDir).appendingPathComponent("CSV")
        try FileManagerExtensions.createDirectoryIfNeeded(at: csvDirectoryURL)
        return csvDirectoryURL
    }
    
    static func exportEvents(events: [TrackEvent], to path: String) throws {
        let csvHeader = "FileName,Category,Action,Label,Value,CustomDimensions\n"
        let url = URL(fileURLWithPath: path)
        
        if !FileManagerExtensions.fileExists(atPath: path) {
            FileManager.default.createFile(atPath: path, contents: Data(csvHeader.utf8))
        }
        
        let fileHandle = try FileHandle(forWritingTo: url)
        defer { fileHandle.closeFile() }
        
        fileHandle.seekToEndOfFile()
        for event in events {
            if let data = event.csvLine.data(using: .utf8) {
                fileHandle.write(data)
            }
        }
    }
}
