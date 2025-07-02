```swift
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var result: [Int] = []
        for i in 0..<nums.count {
            for j in i+1..<nums.count {
                if nums[i] + nums[j] == target {
                    result.append(i)
                    result.append(j)
                }
            }
        }
        return result
    }
}
```

Time Complex: **O(N^2)**

처음엔 O(1+2+3+..+(n^2-1)) 이라고 생각했는데, 상수 지우고 남는 것이 O(N^2)

Space Complex: **O(1)**

결과적으로 2개 값만 나오기 때문

