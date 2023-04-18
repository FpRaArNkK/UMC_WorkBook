# num.2525 Trouble Shooting
---

## Issue  
백준에 제출했을 때 냅다 틀려버렸다.

## Problem
뭐가 문제인지를 모르겠다.

## Solution
Brutal Force로 A(0~23), B(0~59), C(0~1000)에 해당하는
모든 경우의 수를 넣어 알고리즘이 실패하는 경우를 출력하는 코드를 작성했다.
'''
for A in 0..<24{
    for B in 0..<60{
        for C in 0...1000{
            
            let M = B+C
            let H = A + (M/60)
            var M_P:Int = 0
            var H_P:Int = 0

            if M > 59 && H < 23 {
                H_P = H
                M_P = M % 60
            }else if M > 59 && H > 23 {
                H_P = H % 24
                M_P = M % 60
            }else {
                H_P = H
                M_P = M
            }
            
            if H_P >= 24 || H_P < 0 || M_P >= 60 || M_P < 0{
                print(H_P,M_P,"input =",A,B,C)
            }
            
            
            
        }
    }
}

'''

H_P가 23일때만 print로 우르르 뱉어내는걸 확인, 23일때 M_P값이 제대로 계산되지 않았다.
if M > 59 && H < 23 여기에서 H <= 23인데 =을 빼먹었다.

#Brutal Force 체고 #ImBlind

## Reference
[Problem #2563](https://www.acmicpc.net/problem/2525)  
