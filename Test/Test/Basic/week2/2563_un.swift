var count: Int = 0

while true {
    count = Int(readLine()!)!
    if count <= 100 && count >= 1 {
        break
    }
}

var seq_arr: [[Int]] = []

for i in 0..<count {
    let input: String = readLine()!
    let input_arr = input.split(separator: " ").map{Int($0)!}
    seq_arr.append(input_arr)
}

var sub_area_arr: [Int] = []

for i in seq_arr.startIndex..<seq_arr.endIndex{
    for u in 0..<seq_arr.endIndex{
        let x_sub_s = abs(seq_arr[i][0] - seq_arr[u][0])
        let x_sub_e = abs(seq_arr[i][0]+10 - seq_arr[u][0])
        let y_sub_s = abs(seq_arr[i][1] - seq_arr[u][1])

        
        
        
        
        
    }
    
}

print(sub_area_arr)

