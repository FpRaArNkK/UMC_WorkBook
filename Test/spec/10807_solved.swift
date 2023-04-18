let N = Int(readLine()!)!
let input = readLine()!.split(separator: " ")
let v = readLine()!

var count = 0

for i in 0..<input.endIndex {
    if input[i] == v {
        count += 1
    }
}
print(count)
/*이렇게 하면 백준 컴파일러에서는 contains의 argument를 계속 chracter로 받으려함
 let re_arr = input.filter {$0.contains(v)}
 
 print(re_arr.count)
 */
