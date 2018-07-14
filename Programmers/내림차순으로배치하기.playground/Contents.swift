/*:
 # 정수 내림차순으로 배치하기
 
 ## 문제 설명
 
 함수 solution은 정수 n을 매개변수로 입력받습니다. n의 각 자릿수를 큰것부터 작은 순으로 정렬한 새로운 정수를 리턴해주세요. 예를들어 n이 118372면 873211을 리턴하면 됩니다.
 
 ## 제한 조건
 
 - n은 1이상 8000000000 이하인 자연수입니다.
 
 ## 입출력 예
 
 n    return
 
 118372    873211
 */
import UIKit

func solution(_ n:Int64) -> Int64 {
    return Int64(String(n).sorted(by: >).reduce("") {String($0) + String($1)})!
}

/********************************************
 문자열 내림차순에서 sorted.reversed 로 했었는데, 다른 사람의 풀이에서 sorted(by: >)를 보고 사용해보고 싶었다.
 ********************************************/

print("\n---------- [ 다른 사람의 풀이 ] ----------\n")

func solution2(_ n:Int64) -> Int64 {
    var list: [Int] = []
    var val = n
    
    while val > 0 {
        list.append(Int(val % 10))
        val /= 10
    }
    
    list.sort { $0 < $1 }
    val = 1
    
    var answer: Int64 = 0
    
    
    while list.count > 0 {
        answer += Int64(list.removeFirst()) * val
        val *= 10
    }
    
    return answer
}

func solution3(_ n:Int64) -> Int64 {
    var strQuestion: String = String(n)
    var arrQuestion: [String] = []
    var arrResult: [String] = []
    var strResult: String = ""
    
    for i in strQuestion {
        arrQuestion.append(String(i))
    }
    arrResult = arrQuestion.sorted(by: >)
    print(arrResult)
    
    for i in arrResult {
        print(i)
        strResult.append(String(i))
    }
    print("strResult-[\(strResult)]-[\(Int64(strResult)!)]")
    return Int64(strResult)!
}

/********************************************
 대부분 배열에 넣고 정렬했는데, 내림차순이냐 오름차순이냐의 차이였다.
 개인적으로 solution2에서 list처럼 count가 정해진 상황에서는 for-in문을 사용해서 변하는 list의 갯수 때문에 애먹는 상황이 있었다. 당연히 while을 사용하는 것이 당연하지만 신선한 느낌이다.
 solution3에서는 마지막에 String 타입에 append해서 String 타입이 나오는 건 알고는 있지만, 최근 배열로만 하다보니 느낌이 어색해진것 같다. 한눈에 보기에는 [String]으로 보인다.
 ********************************************/
