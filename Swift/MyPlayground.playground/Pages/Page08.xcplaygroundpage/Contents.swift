//: Checkpoint 7:https://www.hackingwithswift.com/quick-start/beginners/checkpoint-7

import Foundation

func deferFunction() {
    defer {
        print("A")
    }
    
    defer {
        print("B")
        defer {
            print("C")
        }
        print("D")
    }
    
    defer {
        print("E")
    }
    
    print("F")
}

//deferFunction() //F E B D C A

func dispatchFunction() {
    print("A")
    
    DispatchQueue.global(qos: .default).async {
        print("B")
        DispatchQueue.main.async {
            print("C")
        }
        print("D")
        DispatchQueue.main.sync {
            print("E")
        }
        
        DispatchQueue.main.async {
            print("F")
            DispatchQueue.main.sync {
                print("G")
            }
        }
        
        print("H")
    }
    
    print("I")
}

dispatchFunction() // A I B D C E H F
