/*:
 # 가운데 글자 가져오기

 ## 문제 설명
단어 s의 가운데 글자를 반환하는 함수, solution을 만들어 보세요. 단어의 길이가 짝수라면 가운데 두글자를 반환하면 됩니다.

 ## 제한사항
- s는 길이가 1 이상, 100이하인 스트링입니다.
 
 ## 입출력 예
 
 **s  |  return**
 
 abcde  |  c
 
 qwer  |  we
*/

/********************************************
 짝수일때:
 asdfgh -> df
 6 -> 3,4 str.count/2, str.count/2 + 1
 3
 
 홀수일때:
 asdfg -> d
 5 -> 3 : str.count/2 + 1
 2
 ********************************************/

func solution(_ s:String) -> String {
    let str = s
    let isEven = str.count % 2 == 0 ? true : false
    
    let beforeindex = str.index(str.startIndex, offsetBy: (str.count/2 - (isEven ? 1 : 0)))
    let halfIndex = str.index(str.startIndex, offsetBy: (str.count/2))
    
    return isEven ? String(str[beforeindex...halfIndex]) : String(str[halfIndex])
}

