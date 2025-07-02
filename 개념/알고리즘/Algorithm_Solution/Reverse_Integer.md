```swift
import Cocoa

// Reverse Integer
class Solution {
    func reverse(_ x: Int) -> Int {
        guard checkRange(x) else {
            return 0
        }
        
        var nums = String(x)
        if nums.first == "-" {
            nums.removeFirst()
            let result = "-" + String(nums.reversed())
            return checkRange(Int(result)!) ? Int(result)! : 0
        } else {
            let result = String(nums.reversed())
            return checkRange(Int(result)!) ? Int(result)! : 0
        }
    }
    
    func checkRange(_ x: Int) -> Bool {
        if x < 2147483647 && x > -2147483648 {
            return true
        } else {
            return false
        }
    }
}
```
// Time Complex: O(N)이 아닌 O(1)
// 이게 이상했는데 Swift 문서를 보니깐 reversed()가 O(1)로 나왔음. 찾아보니 reverse()는 역순으로 배치하는 거고, reversed()는 역순으로 접근할 수 있는거라 그대로임.
// 그래서 처음에는 O(N)이라 생각했는데 문서보고 나서는 O(1)이라 생각함.
// 근데 접근만 바꾼다고는 하지만 실제로 역순으로 배치도 되었으니 실제로 역순으로 돌린게 아닌가 싶은데? 그러면 O(N)인데 잘 모르겠음.

// Space Complex: O(1)
// 이 함수에서 한거는 결국 타입 변환밖에 없음. Int -> String -> Int
// 각각의 데이터 타입에 맞는 사이즈로 변하는 것밖에 없었기 때문에 O(1)
