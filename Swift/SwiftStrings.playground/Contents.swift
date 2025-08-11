import UIKit

extension String {
    var lines: [String] {
        return self.components(separatedBy: "\n")
    }
    
    func withPrefix(_ prefix: String?) -> String {
        guard let prefix = prefix else { return self }
        if self.hasPrefix(prefix) {
            return self
        }
        return prefix + self
    }
    
    var isNumeric: Bool {
        return Double(self) != nil
    }
}

let testWithPrefix = "123"
print(testWithPrefix.withPrefix("0"))
print(testWithPrefix.withPrefix("1"))

let testWithLines = """
123
456
789
"""
print(testWithLines.lines)

print("123".isNumeric)
print("abc123".isNumeric)

let str = "this is a test string"
let attributes: [NSAttributedString.Key: Any] = [
    .foregroundColor: UIColor.white,
    .backgroundColor: UIColor.red,
    .font: UIFont.boldSystemFont(ofSize: 36)
]

let attributedString = NSAttributedString(string: str, attributes: attributes)

let mutableAttributeString = NSMutableAttributedString(string: str)
mutableAttributeString.addAttribute(.font, value: UIFont.systemFont(ofSize: 8), range: NSRange(location: 0, length: 4))
mutableAttributeString.addAttribute(.font, value: UIFont.systemFont(ofSize: 16), range: NSRange(location: 5, length: 2))
mutableAttributeString.addAttribute(.font, value: UIFont.systemFont(ofSize: 24), range: NSRange(location: 8, length: 1))
mutableAttributeString.addAttribute(.font, value: UIFont.systemFont(ofSize: 32), range: NSRange(location: 10, length: 4))
mutableAttributeString.addAttribute(.font, value: UIFont.systemFont(ofSize: 40), range: NSRange(location: 15, length: 6))

let input = "Swift is like Objective-C without C"
input.contains("Swift")

let languages = ["Python", "Ruby", "Swift"]
languages.contains("Swift")

extension String {
    func containsAny(of array: [String]) -> Bool {
        for item in array {
            if self.contains(item) {
                return true
            }
        }
        
        return false
    }
}

input.containsAny(of: languages)

languages.contains(where: input.contains)

let weather = "it's going to rain"
print(weather.capitalized)

extension String {
    var capitalizedFirst: String {
        guard let firstLetter = self.first else { return "" }
        return firstLetter.uppercased() + self.dropFirst()
    }
}

print(weather.capitalizedFirst)

let password = "12345"
password.hasPrefix("123")
password.hasSuffix("456")

extension String {
    func deletePrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        
        return String(self.dropFirst(prefix.count))
    }
    
    func deleteSuffix(_ suffix: String) -> String {
        guard self.hasSuffix(suffix) else { return self }
        
        return String(self.dropLast(suffix.count))
    }
}

var string = "1234567890"
string.deletePrefix("123") // 4567890
string.deleteSuffix("890") // 1234567

print(string) // 1234567890

var name = "Kai"

for letter in name {
    print("give me a \(letter)")
}

let letter = name[name.index(name.startIndex, offsetBy: 2)]

let char = name[2] // crash

extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}

let letter2 = name[2]

