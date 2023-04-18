let N_X = readLine()!.split(separator: " ").map{Int($0)!}
let input = readLine()!.split(separator: " ").map{Int($0)!}

var arr:[Int] = []

for i in 0..<input.endIndex {
    if input[i] < N_X[1] {
        arr.append(input[i])
    }
}

for i in 0..<arr.endIndex{
    print(arr[i], terminator: " ")
}
