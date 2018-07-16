/*:
 # 문제 설명
 
 ## 문제 설명
 
 어떤 문장의 각 알파벳을 일정한 거리만큼 밀어서 다른 알파벳으로 바꾸는 암호화 방식을 시저 암호라고 합니다. 예를 들어 AB는 1만큼 밀면 BC가 되고, 3만큼 밀면 DE가 됩니다. z는 1만큼 밀면 a가 됩니다. 문자열 s와 거리 n을 입력받아 s를 n만큼 민 암호문을 만드는 함수, solution을 완성해 보세요.
 
 ## 제한 조건
 
 - 공백은 아무리 밀어도 공백입니다.
 - s는 알파벳 소문자, 대문자, 공백으로만 이루어져 있습니다.
 - s의 길이는 8000이하입니다.
 - n은 1 이상, 25이하인 자연수입니다.
 
 ## 입출력 예
 
 s    n    result
 
 AB    1    BC
 
 z    1    a
 
 a B z    4    e F d
 
 */
import UIKit

func solution(_ s:String, _ n:Int) -> String {
    var str = s
    var ans = ""
    
    for scalar in str.unicodeScalars {
        if scalar == " " {
            ans.append(" ")
        } else {
            if scalar.value > 64 && scalar.value < 91 {
                var num = scalar.value + UInt32(n)
                if num > 90 {
                    num -= 26
                }
                ans.append(String(UnicodeScalar(num)!))
            } else {
                var num = scalar.value + UInt32(n)
                if num > 122 {
                    num -= 26
                }
                ans.append(String(UnicodeScalar(num)!))
            }
        }
    }
    return ans
}

print("\n---------- [ 다른 사람의 풀이 ] ----------\n")

func solution2(_ s:String, _ n:Int) -> String {
    
    let opted = s.unicodeScalars
        .map { unicodeScala -> UInt32 in
            switch unicodeScala.value {
            case 65...90:
                return (((unicodeScala.value - 65 ) + UInt32(n)) % 26) + 65
            case 97...122:
                return (((unicodeScala.value - 97 ) + UInt32(n)) % 26) + 97
            case 32:
                return unicodeScala.value
            default:
                return unicodeScala.value
                print("NG")
            }
        }
        .map { Unicode.Scalar.init($0) }
        .flatMap { $0 }
        .map { Character.init($0) }
    
    
    return String(opted)
}

/********************************************
 멋지게 풀었다고 생각했다.
 Unicode 32가 공백이다.
 - 1번째 map
 unicodeScala의 value 값으로 UInt32를 구한다.
 - 2번째 map
 UInt32의 값으로 Unicode.Scalar?를 구한다.
 - 3번째 map
 Unicode.Scalar?를 flatmap으로 옵셔널을 풀어주고, 결과값으로 나온 Unicode.Scalar를 Character로 배열을 만든다.
 ********************************************/
