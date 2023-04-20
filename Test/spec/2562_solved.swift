var arr:[Int] = []

for _ in 0..<9 {
    let input = Int(readLine()!)!
    arr.append(input)
}

print(arr.max()!)
print(arr.firstIndex(of: arr.max()!)!+1)
