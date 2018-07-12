/*:
 # 핸드폰 번호 가리기
 
 ## 문제 설명
 
 프로그래머스 모바일은 개인정보 보호를 위해 고지서를 보낼 때 고객들의 전화번호의 일부를 가립니다.
 전화번호가 문자열 phone_number로 주어졌을 때, 전화번호의 뒷 4자리를 제외한 나머지 숫자를 전부 *으로 가린 문자열을 리턴하는 함수, solution을 완성해주세요.
 
 ## 제한 조건
 
 - s는 길이 4 이상, 20이하인 문자열입니다.
 
 ## 입출력 예
 
 phone_number    return
 
 01033334444    *******4444
 
 027778888    *****8888
 */
import UIKit

func solution(_ phone_number:String) -> String {
    var arr = ""
    for i in 0..<phone_number.count {
        if i < phone_number.count - 4 {
            arr.append("*")
        } else {
            arr.append(String(phone_number[String.Index.init(encodedOffset: i)]))
        }
    }
    return arr
}

print("\n---------- [ 다른 사람의 풀이 ] ----------\n")

func solution2(_ phone_number:String) -> String {
    return String("\(String(repeating: "*", count: phone_number.count - 4))\(phone_number.suffix(4))")
}

/********************************************
 String으로 전체 갯수-4개의 *를 만들고, suffix로 뒤에서부터 4개 읽어 왔다.
 ********************************************/

func solution3(_ phone_number:String) -> String {
    
    var result = ""
    for (index, value) in phone_number.enumerated()
    {
        if(index > phone_number.count - 5)
        {
            result += String(value)
        }else{
            result += "*"
        }
    }
    
    return result
}

/********************************************
 String을 튜플로 받으면, 인덱스와 Character를 받는다.
 Array를 튜플로 받으면, 인덱스와 해당 데이터를 받는다.
 ********************************************/
