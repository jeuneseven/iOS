//functions, parameters, and errors
func countDown(from start: Int) {
    var current = start
    while current >= 0 {
        print("\(current)...")
        current -= 1
        print(current)
    }
}
countDown(from: 10)

enum CustomError:Error {
    case CustomErrorType1
    case CustomErrorType2
}

func function(from A:String, to B:String) throws -> String {
    if A == "A" {
        throw CustomError.CustomErrorType1
        return "A"
    } else {
        throw CustomError.CustomErrorType2
        return "B"
    }
    
    return "C"
}

do {
    try function(from: "AC", to: "DC")
} catch {
    
}
//inout func
func paintWalls(tastefully: Bool, color: inout String) {
    if tastefully {
        color = "cream"
    } else {
        color = "tartan"
    }
}
var color = ""
paintWalls(tastefully: true, color: &color)
