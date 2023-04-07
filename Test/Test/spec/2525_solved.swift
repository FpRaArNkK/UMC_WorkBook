let input_AB = readLine()!
let in_arr = input_AB.split(separator: " ")

var A = Int(in_arr[0])!
var B = Int(in_arr[1])!
let C = Int(readLine()!)!

let M = B+C
let H = A+M/60


if M > 59 && H <= 23 {
    print(H,M%60)
}else if M > 59 && H > 23 {
    print(H%24,M%60)
}else {
    print(H,M)
}

//https://www.acmicpc.net/problem/2525
