# Swift Event Parser

## Article on Medium
[Strolling the Meta Shores — A Swift Syntax Journey](https://yoloabdo.medium.com/strolling-the-meta-shores-a-swift-syntax-journey-5cc5bd92322f)

## Overview
This project provides a command-line utility for parsing Swift source files to extract event tracking data and organize it into an Excel sheet. Designed to streamline the process of managing analytics events within a Swift-based iOS project, this tool scans through your project's Swift files, identifies event tracking function calls, and compiles the extracted data into a structured Excel sheet for easy review and management.

## Features
- **Automated Parsing**: Automatically parses all Swift files in the specified directory (including subdirectories) to find event tracking calls.
- **Excel Sheet Generation**: Organizes extracted event data into an Excel sheet, making it easy to view and manage event tracking across your entire project.
- **Flexible File Handling**: Capable of processing a single Swift file or an entire directory of Swift files.

## Prerequisites
- macOS or Linux operating system
- Swift 5.0 or higher
- Access to the terminal or command line
- [SwiftSyntax](https://github.com/apple/swift-syntax) library for parsing Swift source files

## Installation
1. Ensure you have Swift installed on your machine. You can check your Swift version by running `swift --version` in your terminal.
2. Clone this repository to your local machine.
3. Navigate to the project's root directory in your terminal.
4. Build the project using Swift Package Manager:
   ```
   swift build
   ```
5. Once built, you can find the executable in the `.build/debug` directory.

## Usage
To use the Swift Event Parser, follow these steps:

1. Open your terminal and navigate to the directory where the executable is located.
2. Run the following command, replacing `/path/to/your/project` with the actual path to your Swift project or a specific Swift file:
   ```
   ./SwiftEventParser "/path/to/your/project"
   ```
3. The script will process all Swift files in the specified path, extract event tracking data, and generate an Excel sheet with the results.

### Parameters
- **Path**: The path to the Swift file or directory containing Swift files to be processed. The tool recursively searches through directories to find all `.swift` files.

## Output
The tool generates an Excel sheet named `Events.xlsx` in the project's root directory, containing the extracted event data organized in columns such as Category, Action, Label, Value, and Custom Dimensions.

## Troubleshooting
- **Permission Denied**: If you encounter a permission denied error when trying to run the executable, use `chmod +x SwiftEventParser` to make the file executable.
- **SwiftSyntax Compatibility**: Ensure the version of SwiftSyntax you're using is compatible with your Swift version. Refer to the SwiftSyntax GitHub repository for installation and compatibility information.

## Contributing
Contributions to the Swift Event Parser are welcome. Please feel free to fork the repository, make your changes, and submit a pull request.
