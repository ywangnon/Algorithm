/*:
 # x만큼 간격이 있는 n개의 숫자
 
 ## 문제 설명
 
 함수 solution은 정수 x와 자연수 n을 입력 받아, x부터 시작해 x씩 증가하는 숫자를 n개 지니는 리스트를 리턴해야 합니다. 다음 제한 조건을 보고, 조건을 만족하는 함수, solution을 완성해주세요.
 
 ## 제한 조건
 
 - x는 -10000000 이상, 10000000 이하인 정수입니다.
 - n은 1000 이하인 자연수입니다.
 
 ## 입출력 예
 
 x    n    answer
 
 2    5    [2,4,6,8,10]
 
 4    3    [4,8,12]
 
 -4    2    [-4, -8]
 */

import UIKit

func solution(_ x:Int, _ n:Int) -> [Int] {
    var arr: [Int] = []
    for num in stride(from: x, through: x * n, by: x) {
        arr.append(num)
    }
    return arr
}

/********************************************
 제대로 나온다고 생각하지만 웹이어서 그런지 오류가난다.
 ```
 테스트 실행 중 오류가 발생하였습니다.
 Compile Swift Module 'MessagePack' (7 sources)
 Compile Swift Module 'Solution' (1 sources)
 Compile Swift Module 'SolutionTests' (3 sources)
 /Solution/Tests/SolutionTests/SolutionTests.swift:39:27: error: cannot convert value of type '[Int64]' to expected argument type '[Int]'
 XCTAssertEqual(actual0, expected0)
 ^~~~~~~~~
 Fetching /MessagePack.swift
 Cloning /MessagePack.swift
 Resolving /MessagePack.swift at 2.1.1
 ```
 이것에 대해서는 나중에 확인해봐야겠다.
 ********************************************/

func solution2(_ x:Int, _ n:Int) -> [Int] {
    var arr: [Int] = []
    
    for num in 1...n {
        arr.append(x * num)
    }
    
    return arr
}
