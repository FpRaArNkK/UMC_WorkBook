let N_M = readLine()!.split(separator: " ").map{Int($0)!}
let N = N_M[0]
let M = N_M[1]

var basket = Array(repeating: 0, count: N)

for _ in 0..<M {
    let ijk = readLine()!.split(separator: " ").map{Int($0)!}
    let i = ijk[0]-1
    let j = ijk[1]-1
    let k = ijk[2]
    
    for x in i...j {
        basket[x] = k
    }
}

for i in basket {
    print(i,terminator: " ")
}
