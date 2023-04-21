var arr : [Int] = Array(1...30)

for _ in 0..<28 {
    let att = Int(readLine()!)!
    arr.removeAll(where: {$0 == att})
}

print(arr[0])
print(arr[1])
