/*:
 # 문자열 내 p와 y의 개수
 
 ## 문제 설명

대문자와 소문자가 섞여있는 문자열 s가 주어집니다. s에 'p'의 개수와 'y'의 개수를 비교해 같으면 True, 다르면 False를 return 하는 solution를 완성하세요. 'p', 'y' 모두 하나도 없는 경우는 항상 True를 리턴합니다. 단, 개수를 비교할 때 대문자와 소문자는 구별하지 않습니다.

예를들어 s가 pPoooyY면 true를 return하고 Pyy라면 false를 return합니다.

 ## 제한사항

문자열 s의 길이 : 50 이하의 자연수
문자열 s는 알파벳으로만 이루어져 있습니다.

 ## 입출력 예

s    answer
 
pPoooyY    true
 
Pyy    false

 ## 입출력 예 설명

입출력 예 #1
'p'의 개수 3개, 'y'의 개수 3개로 같으므로 true를 return 합니다.

입출력 예 #2
'p'의 개수 1개, 'y'의 개수 2개로 다르므로 false를 return 합니다.
*/

import Foundation

func solution(_ s:String) -> Bool
{
    var ans:Bool = false
    var pCount = 0
    var yCount = 0
    
    for ch in s {
        if ch == "p" || ch == "P" {
            pCount += 1
        }
        if ch == "y" || ch == "Y" {
            yCount += 1
        }
    }

    if pCount == yCount {
        
        ans = true
    }
    
    
    return ans
}

/********************************************
 다시보니 ans를 따로 두는 것도 어색하고, p와 y의 count를 따로 둘 필요가 없다고 생각된다.
 ********************************************/

func solution2(_ s:String) -> Bool
{
    var count = 0
    
    for ch in s {
        if ch == "p" || ch == "P" {
            count += 1
        }
        if ch == "y" || ch == "Y" {
            count -= 1
        }
    }
    
    return count == 0 ? true : false
}

print("\n---------- [ 다른 사람의 풀이 ] ----------\n")

import Foundation

func solution3(_ s:String) -> Bool
{
    var flag: Int = 0
    
    for ch in s.uppercased().sorted() {
        switch ch {
        case "P":
            flag += 1
        case "Y":
            flag -= 1
        default:
            break
        }
    }
    
    return flag == 0
}

/********************************************
 uppercaased()를 사용해서 모두 대문자로 만들어 P, Y 하나씩만 찾았다.
 결과를 보니 내 솔루션 마지막에 삼항연산자로 만들 필요가 없었다.
 ********************************************/

import Foundation

func solution4(_ s:String) -> Bool
{
    let string = s.lowercased()
    return string.components(separatedBy: "p").count == string.components(separatedBy: "y").count
}

/********************************************
 한줄로 나타낼 수 있지 않을까 싶었는데 p, y의 갯수를 따로 구해서 비교하기 복잡해진다고 생각했다.
 하지만 이처럼 각각을 구하는 코드를 비교하면 되었다.
 ********************************************/

var string = "pPoooyY"
print(string.components(separatedBy: "p"))
print(string.components(separatedBy: "Y"))

/********************************************
 마지막에 나눠지는 문자가 있으면 어떻하나 싶었는데, ""처럼 빈값으로 저장된다.
 ********************************************/
