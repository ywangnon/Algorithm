/*:
 # 두 정수 사이의 합
 
 ## 문제 설명
 
 두 정수 a, b가 주어졌을 때 a와 b 사이에 속한 모든 정수의 합을 리턴하는 함수, solution을 완성하세요.
 예를 들어 a = 3, b = 5인 경우, 3 + 4 + 5 = 12이므로 12를 리턴합니다.
 
 ## 제한 조건
 
 a와 b가 같은 경우는 둘 중 아무 수나 리턴하세요.
 a와 b는 -10,000,000 이상 10,000,000 이하인 정수입니다.
 a와 b의 대소관계는 정해져있지 않습니다.
 
 ## 입출력 예
 
 a  |  b  |  return
 
 3  |  5  |  12
 
 3  |  3  |  3
 
 5  |  3  |  12
 
 */

func solution(_ a:Int, _ b:Int) -> Int64 {
    var sum: Int64 = 0
    let bigNumber: Int64 = a > b ? Int64(a) : Int64(b)
    let smallNumber: Int64 = a > b ? Int64(b) : Int64(a)
    
    
    for n in smallNumber...bigNumber {
        sum += n
    }
    
    return sum
}

print("\n---------- [ 다른 사람의 풀이 ] ----------\n")

func solution2(_ a:Int, _ b:Int) -> Int64 {
    return Int64(a + b) * Int64(max(a, b) - min(a, b) + 1) / Int64(2)
}
/********************************************
 공식을 사용한 풀이로 보인다.
 첫수와 끝수를 더하고 그것을 갯수만큼 곱하고 2로 나눈 것이다.
 3...5를 예로 보면
 
 * * *
 * * *
 * * *
 * *
 *   *
   * *
 * * *
 * * *
 * * *
 로 볼 수 있다.
 ********************************************/

func solution3(_ a:Int, _ b:Int) -> Int64 {
    
    let minValue = a < b ? a : b
    let maxValue = a > b ? a : b
    
    var value: Int64 = 0
    for i in minValue...maxValue {
//        value += i
    }
    
    return value
}
/********************************************
 swift는 데이터타입에 엄격하기때문에 int와 int64가 안 더해진다고 생각했는데, 풀이에는 더해졌다.
 xcode로 옮겨보니 역시 불가능.
 ********************************************/

func solution4(_ a:Int, _ b:Int) -> Int64 {
    return Int64(Array(a > b ? b...a : a...b).reduce(0, +))
}
/********************************************
 reduce를 이용했다.
 삼항연산자로 작은수부터 나열된 배열의 집합으로 만들고, 배열의 요소를 reduce를 사용해서 더했다.
 ********************************************/
