/*:
 # 정수 제곱근 판별
 
 ## 문제 설명
 
 임의의 정수 n에 대해, n이 어떤 정수 x의 제곱인지 아닌지 판단하려 합니다.
 n이 정수 x의 제곱이라면 x+1의 제곱을 리턴하고, n이 정수 x의 제곱이 아니라면 -1을 리턴하는 함수를 완성하세요.
 
 ## 제한 사항
 
 - n은 1이상, 50000000000000 이하인 정수입니다.
 
 ## 입출력 예
 
 n    return
 
 121    144
 
 3    -1
 
 ## 입출력 예 설명
 
 입출력 예#1
 121은 정수 11의 제곱이므로, (11+1)를 제곱한 144를 리턴합니다.
 
 입출력 예#2
 3은 정수의 제곱이 아니므로, -1을 리턴합니다.
 */

import UIKit

func solution(_ n:Int64) -> Int64 {
    var count: Int64 = 0
    var ans: Int64 = 0
    while count * count < n {
        count += 1
    }
    
    if count * count == n {
        ans = (count + 1) * (count + 1)
    } else {
        ans = -1
    }
    
    return ans
}

print("\n---------- [ 다른 사람의 풀이 ] ----------\n")

func solution2(_ n:Int64) -> Int64 {
    let doubleValue: Double = Double(n).squareRoot()
    var intValue: Int = Int(doubleValue)
    if (Double(intValue) == doubleValue) {
        intValue += 1
        return Int64(intValue*intValue)
    } else {
        return -1
    }
}

/********************************************
 Double()에 있는 squareRoot()를 사용하였다.
 ********************************************/

extension Int64 {
    func bitCount() -> Int {
        let hexString = String(self, radix: 2, uppercase: false)
        return hexString.count
    }
}

func solution3(_ n:Int64) -> Int64 {
    let sqrtBitCount: Int = (n.bitCount() + 1) / 2
    let min, max: Int64
    min = 1 << Int(sqrtBitCount - 1)
    max = 1 << sqrtBitCount
    
    for i in min..<max {
        if i * i == n {
            return (i + 1) * (i + 1)
        } else if i * i > n {
            break
        }
    }
    
    return -1
}

/*:
 Int64를 확장하였다.
 주어진 값을 2진수 값의 자릿로 표현했다.
 이 자릿수에 1을 더해서 2로 나누면 제곱근 값
 
 min과 max는 범위값내에서 제곱근이 되는지 값을 넘겨서 제곱근이 없는지를 확인하는 작업같다.
 
 bit계산으로 하여 너무 어렵다.
 
 처음에 왜 저렇게 되는지 모르겠다.
 */
