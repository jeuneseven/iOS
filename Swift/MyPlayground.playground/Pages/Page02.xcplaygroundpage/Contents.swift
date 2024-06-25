
func countDown(from start: Int) {
    var current = start
    while current >= 0 {
        print("\(current)...")
        current -= 1
        print(current)
    }
}
countDown(from: 10)
