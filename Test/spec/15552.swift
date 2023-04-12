let T = Int(readLine()!)!



/* //시간초과
 for i in 0..<T{
 let AB = readLine()!.split(separator: " ").map{Int($0)!}
 print(AB[0]+AB[1])
}*/

/*
 for i in 0..<T {
     let AB = readLine()!
     print (Int(AB[AB.startIndex])!+Int(AB[AB.endIndex-1])!)
 }
*/
/* !!!
 Swift의 문자열(String)은 인덱싱이 가능하지만, 문자열의 각각의 문자(Character)에 접근하기 위해서는 문자열을 배열(Array)로 변환하여 접근해야 합니다. 즉, AB[AB.startIndex]와 AB[AB.endIndex-1] 대신에, AB.first!와 AB.last!를 사용해야 합니다.
 */

/*
 for i in 0..<T {
     var AB = readLine()!
     AB.replaceSubrange(AB.index(after: AB.startIndex)...AB.index(after:AB.startIndex), with: "+")
     print(AB)
    근데 스위프트에서는 문자열을 수식변환해주는게 없다 ㅋㅋㅋ
 }
 */
