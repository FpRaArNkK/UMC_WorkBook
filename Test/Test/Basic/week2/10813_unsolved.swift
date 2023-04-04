var arr_basket: [Int] = []
var arr_num: [Int] = []
var flag = true
var N: Int = -1
var M: Int = -1

while flag == true {
    let num_str = readLine()!
    let num_arr = num_str.split(separator: " ")
    N = Int(num_arr[0])!
    M = Int(num_arr[1])!
    
    if N >= 1 && N <= 100 && M >= 1 && M <= 100 {
        flag = false
    }
}

for i in 1...N {
    arr_basket.append(i)
    arr_num.append(i)
}

for i in 0..<M {
    var flag_i = true
    var swap_str: String = ""
    var swap_arr: [String] = []
    while flag_i == true {
        swap_str = readLine()!
        swap_arr = swap_str.split(separator: " ").map(String.init)
        if Int(swap_arr[0])!-1 >= 1 || Int(swap_arr[0])!-1 <= N || Int(swap_arr[1])!-1 >= 1 || Int(swap_arr[1])!-1 <= N {
            flag_i = false
        }
    }
    arr_num.swapAt(Int(swap_arr[0])!-1, Int(swap_arr[1])!-1)
}

print(arr_num)
