var flag = true

while flag == true {
    let score = Int(readLine()!)!

    if score >= 0 && score <= 100 {
        if score <= 100 && score >= 90 {
            print("A")
        } else if score <= 89 && score >= 80 {
            print("B")
        } else if score <= 79 && score >= 70 {
            print("C")
        } else if score <= 69 && score >= 60 {
            print("D")
        } else { print("F") }
        flag = false
    }
}
