let T = Int(readLine()!)!

for _ in 0..<T {
    let input = readLine()!
    print(input[input.startIndex],terminator: "")
    print(input[input.index(before: input.endIndex)])
}
