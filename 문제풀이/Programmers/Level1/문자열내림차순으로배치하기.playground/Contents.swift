/*:
 # 문자열 내림차순으로 배치하기
 
 ## 문제 설명
 
 문자열 s에 나타나는 문자를 큰것부터 작은 순으로 정렬해 새로운 문자열을 리턴하는 함수, solution을 완성해주세요.
 s는 영문 대소문자로만 구성되어 있으며, 대문자는 소문자보다 작은 것으로 간주합니다.
 
 ## 제한 사항
 
 str은 길이 1 이상인 문자열입니다.
 
 ## 입출력 예
 
 s    return
 
 Zbcdefg    gfedcbZ
*/

func solution(_ s:String) -> String {
    var str = s
    
    var ans = ""
    for ch in str.sorted().reversed() {
        ans.append(ch)
    }
    
    return ans
}

print("\n---------- [ 다른 사람의 풀이 ] ----------\n")

func solution2(_ s:String) -> String {
    return String(s.sorted { $0 > $1 })
}

/********************************************
 바로 sorted의 룰만 정해주어 사용하였다.
 다른 풀이도 이것을 어느정도로 풀어쓰냐로 라인 수가 결정되었다.
 ********************************************/
