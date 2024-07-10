//Protocols

//needs a type annotation
protocol Swimmable {
    var depth: Double { get set }
}

//Extensions
extension Double {
    var isNegative: Bool {
        return self < 0
    }
}

extension String {
    mutating func append(_ other: String) {
        self += other
    }
}

