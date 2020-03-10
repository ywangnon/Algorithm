```swift
import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var answer: [Int:Float] = [:]
    var stages = stages
    for i in 1...N {
        let max = stages.count
        if max == 0 {
            answer.updateValue(0, forKey: i)
        } else {
            stages = stages.filter { $0 > i }
            let rate = Float(max - stages.count) / Float(max)
            answer.updateValue(rate, forKey: i)
        }
    }

    let value = answer
        .sorted(by: { (arg0, arg1) -> Bool in
            if arg0.value == arg1.value {
                return arg0.key < arg1.key
            } else {
                return arg0.value > arg1.value
            }})
        .map { $0.key }
    return value // answer.sorted(by: <).sorted(by: { $0.value > $1.value }).map{ $0.key }
}

// Time Complex: O(N^M)
// 유저수(M), 스테이지수(N)으로 O(N^M)
// O(N^M) + O(NlogN + N) -> O(N^M)
// 시간초과됨

// Space Complex: O(N)
// 유저수(M), 스테이지수(N)으로 유저수배열(stages), 리턴값(answer)
// O(N) + O(M) -> O(N)

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var max = stages.count
    var failureStages = [Int:Int]()
    var answer = [Int:Float]()
    for stage in stages {
        if let value = failureStages[stage] {
            failureStages.updateValue(value + 1, forKey: stage)
        } else {
            failureStages.updateValue(1, forKey: stage)
        }
    }
    for i in 1...N {
        let head = failureStages[i]
        let value = Float(head ?? 0) / Float(max)
        answer.updateValue(value, forKey: i)
        max -= head ?? 0
    }
    return answer.sorted(by: <).sorted(by: { $0.value > $1.value }).map{ $0.key }
}

// Time Complex: O(N)
// 유저수(M), 스테이지수(N)으로 O(N + M)
// 각 스테이지별 확률로 이루어진 배열을 sort하므로 O(nlogn), 2번하므로 O(2nlogn) 마지막 map O(n)
// O(N) + O(M) + O(NlogN + NlogN + N) -> O(N)

// Space Complex: O(N)
// 유저수(M), 스테이지수(N) 스테이지수만큼 딕셔너리 생성
// O(N) + O(N) -> O(N)
```
