let T = Int(readLine()!)!

for i in 0..<T {
    var arr = readLine()!.split(separator: " ").map{Int($0)}
    print(arr[0]!+arr[1]!)
}
