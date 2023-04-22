let N_M = readLine()!.split(separator: " ").map{Int($0)!}
let N = N_M[0]
let M = N_M[1]

var basket = Array(1...N)

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let s_index = input[0]
    let e_index = input[1]
    let range = s_index-1...e_index-1
    
    let reversedArray = Array(basket[range].reversed())
    basket[range] = ArraySlice(reversedArray)
}

for i in basket {
    print(i, terminator: " ")
}


//ArraySlice는 Swift의 Array 타입의 일종으로, Array와 비슷하지만 내부적으로는 독립적인 메모리 공간을 가지고 있습니다. ArraySlice는 Array의 특정 부분을 참조하는 것으로 만들어지며, Array와 마찬가지로 순회 및 수정할 수 있습니다.
