/*:
 # 자연수 뒤집어 배열로 만들기
 
 ## 문제 설명
 
 자연수 n을 뒤집어 각 자리 숫자를 원소로 가지는 배열 형태로 리턴해주세요. 예를들어 n이 12345이면 [5,4,3,2,1]을 리턴합니다.
 
 ## 제한 조건
 
 - n은 10,000,000,000이하인 자연수입니다.
 
 입출력 예
 
 n    return
 
 12345    [5,4,3,2,1]
 */

import UIKit
import Foundation

func solution(_ n:Int64) -> [Int] {
    var num: Int = Int(n)
    var arr: [Int] = []

    while num > 0 {
        arr.append(num % 10)
        num /= 10
    }
    
    return arr
}

print("\n---------- [ 다른 사람의 풀이 ] ----------\n")

func solution2(_ n:Int64) -> [Int] {
    var val = n
    var answer: [Int] = []
    
    while val > 0 {
        answer.append(Int(val % 10))
        val /= 10
    }
    
    return answer
}

/********************************************
 Int64를 처음에 Int변수로 바꾸는 것이 꺼림직했었다.
 문제가 된다고는 생각하지 않지만, 별 이유없이 타입을 변환하는 것 같았다.
 개인적으로는 위처럼 그대로받아서 나눈 나머지를 Int로 받는 것이 깔끔하다고 느껴진다.
 ********************************************/
