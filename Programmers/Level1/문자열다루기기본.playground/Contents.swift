/*:
 # 문자열 다루기 기본
 
 ## 문제 설명
 
 문자열 s의 길이가 4혹은 6이고, 숫자로만 구성되있는지 확인해주는 함수, solution을 완성하세요.
 예를들어 s가 a234이면 False를 리턴하고 1234라면 True를 리턴하면 됩니다.
 
 ## 제한 사항
 
 - s는 길이 1 이상, 길이 8 이하인 문자열입니다.
 
 ## 입출력 예
 
 s    return
 
 a234    false
 
 1234    true
 */

func solution(_ s:String) -> Bool {
    if s.count == 4 || s.count == 6 {
        if Int(s) != nil {
            return true
        }
    }
    
    return false
}

print("\n---------- [ 다른 사람의 풀이] ----------\n")

// 크게 Int(s)를 사용해서 숫자로 변환 가능한가와 0...9까지의 범위를 정해줘서 그 이외를 false로 주느냐로 갈렸다.

func solution2(_ s:String) -> Bool {
    let length = s.count
    if length != 4 && length != 6 {
        return false
    }
    for char in s {
        if char < "0" || char > "9" {
            return false
        }
    }
    return true
}

func solution3(_ s:String) -> Bool {
    
    switch s.count {
    case 4, 6:
        break
    default:
        return false
    }
    
    for ch in s {
        switch ch {
        case "0"..."9":
            continue
        default:
            return false
        }
    }
    
    return true
}

/********************************************
 위 두 풀이는 for-in을 사용해서 하나씩 따온 Character가 0...9에 있느냐 없느냐로 bool값을 정해주었다.
 ********************************************/
