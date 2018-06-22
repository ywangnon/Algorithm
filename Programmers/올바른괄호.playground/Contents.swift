/*:
 # 올바른 괄호
 
 ## 문제 설명

올바른 괄호란 두 개의 괄호 '(' 와 ')' 만으로 구성되어 있고, 괄호가 올바르게 짝지어진 문자열입니다. 괄호가 올바르게 짝지어졌다는 것은 '(' 문자로 열렸으면 반드시 짝지어서 ')' 문자로 닫혀야 합니다.
예를들어

 - ()() 또는 (())() 는 올바른 괄호입니다.
 - )()( 또는 (()( 는 올바르지 않은 괄호입니다.
 - '(' 또는 ')' 로만 이루어진 문자열 s가 주어졌을 때, 문자열 s가 올바른 괄호이면 true를 return 하고, 올바르지 않은 괄호이면 false를 return하는 solution 함수를 완성해 주세요.

 ## 제한사항

 - 문자열 s의 길이 : 100,000 이하의 자연수
 - 문자열 s는 '(' 또는 ')' 로만 이루어져 있습니다.

 ## 입출력 예

**s  |  answer**
 
()()  |  true
 
(())()  |  true
 
)()(  |  false
 
(()(  |  false

 */

/*:
 ## <사고과정>
 ### 성립되지 않는 경우
 - "("의 갯수와 ")"가 다를때
 - 위의 상황에서 열지 않았는데 닫은 경우
 */

import Foundation

func solution(_ s:String) -> Bool
{
    let arr = Array(s)
    var openCount = 0
    
    for ch in arr {
        if ch == "(" {
            openCount += 1
        } else {
            openCount -= 1
        }
        
        if openCount < 0 {
            return false
        }
    }
    
    if openCount != 0 {
        return false
    }
    
    return true
}


