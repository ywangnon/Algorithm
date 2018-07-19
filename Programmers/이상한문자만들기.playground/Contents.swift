/*:
 # 이상한 문자 만들기
 
 ## 문제 설명
 
 문자열 s는 한 개 이상의 단어로 구성되어 있습니다. 각 단어는 하나 이상의 공백문자로 구분되어 있습니다. 각 단어의 짝수번째 알파벳은 대문자로, 홀수번째 알파벳은 소문자로 바꾼 문자열을 리턴하는 함수, solution을 완성하세요.
 
 ## 제한 사항
 
 문자열 전체의 짝/홀수 인덱스가 아니라, 단어(공백을 기준)별로 짝/홀수 인덱스를 판단해야합니다.
 
 ## 입출력 예
 
 s    return
 
 try hello world    TrY HeLlO WoRlD
 
 ## 입출력 예 설명
 
 try hello world는 세 단어 try, hello, world로 구성되어 있습니다. 각 단어의 짝수번째 문자를 대문자로, 홀수번째 문자를 소문자로 바꾸면 TrY, HeLlO, WoRlD입니다. 따라서 TrY HeLlO WoRlD 를 리턴합니다.
 */

import UIKit
import Foundation

func solution(_ s:String) -> String {
    var ans = ""
    
    for (index, char) in s.enumerated() {
        if index % 2 == 0 {
            ans += String(char).uppercased()
        } else {
            ans += String(char).lowercased()
        }
    }
    
    return ans
}

/********************************************
 전체가 아닌 단어별로 구성해야한다.
 ********************************************/

func solution2(_ s:String) -> String {
    var ans = s.characters.split(separator: " ").map { String($0) }
        .map { (value) -> String in
            var ans = ""
            for (index, char) in value.enumerated() {
                if index % 2 == 0 {
                    ans += String(char).uppercased()
                } else {
                    ans += String(char).lowercased()
                }
            }
            return ans
        }
        .reduce("") { $0 + $1 + " "}
    ans.removeFirst()
    
    return ans
}

/********************************************
 알고보니 딱히 구분하지 않고 공백을 주는 경우가 있는 것 같다.
 "Hello World"와 "Hello World "의 차이 정도
 공백을 그대로 유지하고 나머지를 바꿔야한다.
 ********************************************/

func solution3(_ s:String) -> String {
    var ans = ""
    var index = 0
    
    for char in s {
        if char != " " {
            if index % 2 == 0 {
                ans += String(char).uppercased()
            } else {
                ans += String(char).lowercased()
            }
            index += 1
        } else {
            ans += " "
            index = 0
        }
    }
    
    return ans
}

