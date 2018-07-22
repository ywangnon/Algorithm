/*:
 # 최대공약수와 최소공배수
 
 ## 문제 설명
 
 두 수를 입력받아 두 수의 최대공약수와 최소공배수를 반환하는 함수, solution을 완성해 보세요. 배열의 맨 앞에 최대공약수, 그다음 최소공배수를 넣어 반환하면 됩니다. 예를 들어 두 수 3, 12의 최대공약수는 3, 최소공배수는 12이므로 solution(3, 12)는 [3, 12]를 반환해야 합니다.
 
 ## 제한 사항
 
 - 두 수는 1이상 1000000이하의 자연수입니다.
 
 ## 입출력 예
 
 n    m    return
 
 3    12    [3, 12]
 
 2    5    [1, 10]
 
 ## 입출력 예 설명
 
 입출력 예 #1
 위의 설명과 같습니다.
 
 입출력 예 #2
 자연수 2와 5의 최대공약수는 1, 최소공배수는 10이므로 [1, 10]을 리턴해야 합니다.
 */

import UIKit

func solution(_ n:Int, _ m:Int) -> [Int] {
    var min = n < m ? n : m
    var max = n > m ? n : m
    var GCD = 0
    var LCM = 0

    for num in 1...min {
        if n % num == 0 && m % num == 0 {
            GCD = num
        }
    }
    
    for num in max...(n * m) {
        if num % n == 0 && num % m == 0 {
            LCM = num
            break
        }
    }
    return [GCD, LCM]
}

print("\n---------- [ 다른 사람의 풀이 ] ----------\n")

func gcd(_ a: Int, _ b: Int) -> Int {
    let mod: Int = a % b
    return 0 == mod ? min(a, b) : gcd(b, mod)
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a, b)
}

func solution2(_ n:Int, _ m:Int) -> [Int] {
    return [gcd(n, m), lcm(n, m)]
}

/********************************************
 대부분 큰 값, 작은 값을 구한 후 반복을 통해 구했지만, 여기서는 "유클리드 호제법"을 사용하였다.
 ********************************************/
