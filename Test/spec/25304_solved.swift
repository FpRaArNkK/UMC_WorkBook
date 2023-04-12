let X = Int(readLine()!)!
let A = Int(readLine()!)!
var total = 0

for i in 0..<A {
    let N = readLine()!.split(separator: " ").map{Int($0)!}
    total += N[0] * N[1]
}

if X == total {
    print("Yes")
} else {
    print("No")
}
