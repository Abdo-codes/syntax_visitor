import Foundation
import SwiftSyntax

class EventCallSyntaxVisitor: SyntaxVisitor {
    var fileName: String
    var events: [TrackEvent] = []
    
    init(fileName: String) {
        self.fileName = fileName
        super.init(viewMode: .all)
    }
    
    override func visit(_ node: FunctionCallExprSyntax) -> SyntaxVisitorContinueKind {
        guard node.calledExpression.description.contains("trackEvent") else {
            return .visitChildren
        }
        
        var category: String?
        var action: String?
        var label: String?
        var value: String?
        var customDimensions: String?
        
        for argument in node.arguments {
            switch argument.label?.text {
            case "category":
                category = argument.expression.description.trimmingQuotes()
            case "action":
                action = argument.expression.description.trimmingQuotes()
            case "label":
                label = argument.expression.description.trimmingQuotes()
            case "value":
                value = argument.expression.description
            case "customDimensions":
                customDimensions = argument.expression.description.trimmingQuotes()
            default:
                break
            }
        }
        
        if let category = category, let action = action, let value = value {
            let event = TrackEvent(fileName: self.fileName, category: category, action: action, label: label ?? "", value: value, customDimensions: customDimensions ?? "")
            events.append(event)
        }
        
        return .skipChildren
    }
}
extension String {
    /// Helper function to trim double quotes from a string.
    func trimmingQuotes() -> String {
        return trimmingCharacters(in: CharacterSet(charactersIn: "\""))
    }
}
