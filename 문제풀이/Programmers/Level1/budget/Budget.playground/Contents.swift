import Foundation


func solution(_ d:[Int], _ budget:Int) -> Int {
    var arr = d
    var count = 0
    var total = 0
    arr.sort()
    
    while total < budget && count < arr.count {
        total += arr[count]
        count += 1
    }
    
    if count == arr.count && total < budget {
        
    } else if total != budget {
        count -= 1
    }
    
    
    
    return count
}

solution([1,3,2,5,4], 9)
solution([2,2,3,3], 11)

print("----[다른 사람의 풀이]----")

func solution2(_ d:[Int], _ budget:Int) -> Int {
    var arr = d
    var total = 0
    var number = 0
    arr.sort()
    for i in 0..<arr.count {
        total += arr[i]
        if total <= budget {
            number = i + 1
        }
    }
    return number
}

/*
 대부분 for 문을 사용하였다.
 개인적으로 모든 요소를 반복하는 것보다 필요한 만큼만 돌고 싶어서 while문을 썼지만
 그에 따라 뒷부분 if문을 이상하게 적용한 것 같다.
 나중에 if문 부분을 수정해야겠다.
 */
