
 /*:
 # 자릿수 더하기
 
 ## 문제 설명
 
 자연수 N이 주어지면, N의 각 자릿수의 합을 구해서 return 하는 solution 함수를 만들어 주세요.
 예를들어 N = 123이면 1 + 2 + 3 = 6을 return 하면 됩니다.
 
 ## 제한사항
 
 - N의 범위 : 100,000,000 이하의 자연수
 
 ## 입출력 예
 
 N    answer
 
 123    6
 
 987    24
 
 ## 입출력 예 설명
 
 입출력 예 #1
 문제의 예시와 같습니다.
 
 입출력 예 #2
 9 + 8 + 7 = 24이므로 24를 return 하면 됩니다.
 */
import UIKit
import Foundation

func solution(_ n:Int) -> Int
{
    var num = n
    var sum = 0
    
    while num > 0 {
        sum += num % 10
        num /= 10
    }
    
    return sum
}

print("\n---------- [ 다른 사람의 풀이 ] ----------\n")

func solution2(_ n:Int) -> Int
{
    var answer:Int = 0
    let string:String = String(n)
    for char in string {
        if let number = Int(String(char)) {
            answer += number
        }
    }
    return answer
}

/********************************************
 String으로 for문을 사용하면, 하나하나 Character로 나오는 것을 이용하였다.
 Character로 나온 것을 String으로 바꾸고, 그것을 다시 Int로 바꾼다.
 ********************************************/

func solution3(_ n:Int) -> Int
{
    let string:String = String(n)
    return string.reduce(0) { $0 + Int(String($1))!}
}

/********************************************
 응용해서 풀고 성공
 ********************************************/
