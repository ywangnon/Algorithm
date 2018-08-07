/*:
 # 최댓값과 최솟값
 
 ## 문제 설명
 
 문자열 s에는 공백으로 구분된 숫자들이 저장되어 있습니다. str에 나타나는 숫자 중 최소값과 최대값을 찾아 이를 (최소값) (최대값)형태의 문자열을 반환하는 함수, solution을 완성하세요.
 예를들어 s가 1 2 3 4라면 1 4를 리턴하고, -1 -2 -3 -4라면 -4 -1을 리턴하면 됩니다.
 
 ## 제한 조건
 
 - s에는 둘 이상의 정수가 공백으로 구분되어 있습니다.
 
 ## 입출력 예
 
 s    return
 
 1 2 3 4    1 4
 
 -1 -2 -3 -4    -4 -1
 
 -1 -1    -1 -1
 */

import UIKit
import Foundation

func solution(_ s:String) -> String {
    let str = s.split(separator: " ")
    let max = str.map {Int(String($0))}
            .flatMap {$0}.max()!
    let min = str.map {Int(String($0))}
        .flatMap {$0}.min()!
    return "\(min) \(max)"
}

print("\n---------- [ 다른 사람의 풀이 ] ----------\n")

func solution2(_ s:String) -> String {
    var arr = s.components(separatedBy: " ").map({(value:String) -> Int in return Int(value)!})
    arr.sort()
    return String(arr[0]) + " " + String(arr[arr.count - 1])
}

/********************************************
 공백으로 구분된 배열을 정렬해서 가장 작은 처음과 가장 큰 마지막을 리턴
 ********************************************/
