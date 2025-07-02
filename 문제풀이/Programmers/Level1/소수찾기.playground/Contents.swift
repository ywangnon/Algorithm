/*:
 # 소수 찾기
 
 ## 문제 설명
 
 1부터 입력받은 숫자 n 사이에 있는 소수의 개수를 반환하는 함수, solution을 만들어 보세요.
 
 소수는 1과 자기 자신으로만 나누어지는 수를 의미합니다.
 (1은 소수가 아닙니다.)
 
 ## 제한 조건
 
 n은 2이상 1000000이하의 자연수입니다.
 
 ## 입출력 예
 
 n    result
 
 10    4
 
 5    3
 
 ## 입출력 예 설명
 
 입출력 예 #1
 1부터 10 사이의 소수는 [2,3,5,7] 4개가 존재하므로 4를 반환
 
 입출력 예 #2
 1부터 5 사이의 소수는 [2,3,5] 3개가 존재하므로 3를 반환
 */

import UIKit

func solution(_ n:Int) -> Int {
    var div = 2
    var isPrime = true
    var primeCount = 0
    
    print("\n---------- [ \(n)의 소수 ] ----------\n")
    
    while div <= n {
        print("\n---------- [ div ] ----------\n")
        print(div)
        
        for i in 2..<div {
            print("\n---------- [ div % i ] ----------\n")
            print("\(div)%\(i) = \(div % i)")

            if div % i == 0 {
                isPrime = false
            }
        }
        
        if isPrime {
            print("\n---------- [ \(div)는 소수 ] ----------\n")
            primeCount += 1
        }
        div += 1
        isPrime = true
    }
    
    return primeCount
}

/********************************************
 시간 초과로 실패!!!!
 10번부터 시간초과
 이런 경우는 처음이다. 효율을 높여야 한다.
 현재는 n개가 있다면 대략 n * n / 2번 해야한다.
 
 2 3 4 ... n
 -----------
   2 2 ... 2
     3 ... 3
           4
           .
           .
           .
          n-1
 
 ※ 정확히는 (n-1) * (n-2) / 2 다.
 
 제한조건이 1000000이하의 자연수이기 때문에 가장 큰 수는
 4.999985e11이라는 어마어마한 수가 된다.
 
 현재는 2부터 시작해서 n까지 그 수가 소수인지 다시 2부터 n-1까지 계속 나누어 확인해보는 작업을 거친다.
 처음 생각한 것은
 1. 2부터 시작해서 배수들을 지워나가는 것
 2. 2부터 시작해서 각각 true, false를 주고 true값만 다시 읽는 것
 3. 지금 시간 초과 된 것
 
 그냥 나누는게 코드짜기 쉬울 것 같다고 생각해서 3번으로 짠 것이다.
 ********************************************/

/********************************************
 이왕 처음부터 고민하게 된 거 가장 효율이 좋을 것이라 예상되는 1번으로 짜기로 결정.
 1. 2부터 n까지 배열로 만들고, 가장 앞 수를 읽는다.
 2. 읽은 수의 배수는 다 지운다.
 3. 배수가 지워진 배열의 가장 앞 수를 읽는다.
 4. 2로 돌아가서 배열의 count가 0이 될 때 까지 반복
 5. 1부터 입력 가능하기 때문에 1은 예외로 return 시킨다. 라고 생각했더니 div가 2부터이기 떄문에 1이면 count 되지 않아 0으로 나온다.
 ********************************************/

func solution2(_ n:Int) -> Int {
    var arr = Array(2...n)
    var removeNumber = 0
    var multipleCount = 2
    var ansArr: [Int] = []
    
    print("\n---------- [ \(n)의 소수 ] ----------\n")
    
    while arr.count > 0 {
        removeNumber = arr.removeFirst()
        ansArr.append(removeNumber)
        print("\n---------- [ 삭제전 ] ----------\n")
        print(removeNumber)
        print(arr)
        print(ansArr)
        while removeNumber * multipleCount <= n {
            if arr.contains(removeNumber * multipleCount) {
                arr.remove(at: arr.index(of: removeNumber * multipleCount)!)
            }
            multipleCount += 1
        }
        
        multipleCount = 2
        print("\n---------- [ 삭제후 ] ----------\n")
        print(arr)
        print(ansArr)
    }
    
    return ansArr.count
}

/********************************************
 10번부터 시간초과
 while문의 while문 까지는 Array가 점점 삭제되서 1번보다는 나아지지만 contain 을 사용하면 contain은 기본적으로 for문이기 떄문에 반복문의 반복문의 반복문이 된다.
 알고는 있지만 체크를 하기위해 꺼림직해도 사용한게 독이 되었다. 그렇다고 체크를 안하면 nil이라고 오류가 난다. 예를 들어 6의 경우 2에서도 지우고 3에서도 지우는 데 2에서 지워 없기 때문에 3의 배수로 지울때는 없는 것을 지우라고 하여 오류가 난다.
 ********************************************/

/********************************************
 2번으로 다시
 1. 갯수만큼 true로 채워진 배열 생성
 2. 1은 소수가 아니므로 false로 바꿔줌
 3. 1 이외에는 true인 값만 count를 올려주고, count 한 수의 배수를 false로 바꿔줌
 ********************************************/

func solution3(_ n:Int) -> Int {
    var checkArr = Array.init(repeating: true, count: n)
    var ansCount = 0
    
    print("\n---------- [ \(n)의 소수 ] ----------\n")
    
    for i in 0..<n {
        let num = i + 1
        var multiple = 2
        
        if num == 1 {
            checkArr[i] = false
            continue
        } else {
            if checkArr[i] {
                print(num)
                ansCount += 1
                while num * multiple <= n {
                    checkArr[num * multiple - 1] = false
                    multiple += 1
                }
            }
        }
    }
    
    return ansCount
}

print("\n---------- [ 다른 사람의 풀이 ] ----------\n")

func solution4(_ n:Int) -> Int {
    var isPrime: [Bool] = [Bool](repeating: true, count: n)
    var count: Int = 0
    
    guard 3 < n else {
        return n - 1
    }
    
    //  1은 소수가 아니다
    isPrime[0] = false
    
    //  2를 제외한 2의 배수는 소수가 아니다
    count += 1
    for i in 2...n / 2 {
        isPrime[i * 2 - 1] = false
    }
    
    for i in stride(from: 3, through: n, by: 2) {
        var j = i
        
        //  이미 소수가 아닌 것으로 판정된 경우에는 더 볼 필요 없다
        guard isPrime[j - 1] else {
            continue
        }
        
        while (j <= n) {
            if j == i {
                isPrime[j - 1] = true
                count += 1
            } else {
                isPrime[j - 1] = false
            }
            
            j += i * 2
        }
    }
    
    return count
}

/********************************************
 3이하를 예외로 두고 따로 guard로 빼주었다.
 1 -> 0
 2 -> [2]
 3 -> [2, 3]
 
 3보다 클 때는
 1을 false처리하고,
 2를 count 한 후, 배수들을 모두 제외시켰다.
 반복문을 3부터 시작하는 홀수로 하기때문에 내 코드보다 작업량과 시간이 적을 것이라 예상된다.
 
 개인적으로 따로 예외를 두는 식의 코드를 지양한다. 코드를 짜면서 1을 따로 빼는 것이 찝찝했다.
 하지만 실제적인 시간과 작업량이 줄어드는 것이 중요하다는 것을 배웠다.
 ********************************************/
