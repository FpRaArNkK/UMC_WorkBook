let N = Int(readLine()!)!
let long: String = "long "

for i in stride(from: 0, to: N, by: 4){
    print(long, terminator: "")
}
print("int")

//print(long * N,"int") //Swift에서는 이거 안되나요
 
