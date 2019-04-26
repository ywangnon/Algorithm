import UIKit
import Foundation

func solution(_ n:Int) -> Int
{
    var answer:Int = 0
    
    var binaryNumber = Int(convertBinaryNumber(n))
    
    
    
    return answer
}

func convertBinaryNumber(_ number: Int) -> String {
    if number == 0 || number == 1 {
        return String(number)
    }
    return convertBinaryNumber(number/2) + String(number%2)
}

