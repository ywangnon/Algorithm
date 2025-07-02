func solution(number: Int) -> String {
    var num = number
    var ans = ""
    var arr: [Int] = []
    
    
    for n in 1...num {
        if num % n == 0 {
            arr.append(n)
        }
    }
    
    for n in arr {
        ans += " " + String(n)
    }
    
    return ans
}

solution(number: 20)
solution(number: 100)
