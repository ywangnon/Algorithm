//: Playground - noun: a place where people can play

import UIKit

public func solution(_ N : Int) -> Int {
    var ans = N
    var val = 0
    var max = 0
    var count = 0
    var isGap = false
    
    while ans != 1 {
        val = ans % 2
        ans = ans / 2
        
        if val == 1 {
            isGap = true
            count = 0
        } else if val == 0 && isGap == true {
            count += 1
            max = count > max ? count : max
        }
    }
    
    return max
}

solution(9)
solution(529)
solution(20)
solution(32)
solution(15)
