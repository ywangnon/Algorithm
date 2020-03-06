```swift
import UIKit

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    
    for index in 0..<n {
        let num = String(arr1[index] | arr2[index], radix: 2)
        let zeroCount = [String](repeating: "0", count: n - num.count).reduce("", +)
        answer.append((zeroCount + num).reduce("", { (result, char) -> String in
            if char == "1" {
                return result + "#"
            } else {
                return result + " "
            }
        }))
    }
    return answer
}
```

// Time Complex: O(N^2)
// n번 반복하면서 n자리 수의 reduce작업을 하기 때문에 n^2

// Space Complex: O(N^2)
// answer 변수는 결국 N x N 크기 배열로 만들어진다.
