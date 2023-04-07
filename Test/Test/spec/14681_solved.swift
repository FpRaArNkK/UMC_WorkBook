let input_x = Int(readLine()!)!
let input_y = Int(readLine()!)!

if input_x > 0 {
    if input_y > 0 {
        print(1)
    } else if input_y < 0 {
        print(4)
    } else {
        print("none")
    }
}else if input_x < 0 {
    if input_y > 0 {
        print(2)
    } else if input_y < 0 {
        print(3)
    } else {
        print("none")
    }
}else {
    print("none")
}

//https://www.acmicpc.net/problem/14681
