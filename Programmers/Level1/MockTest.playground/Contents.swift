import UIKit
import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let firstStudent = [1,2,3,4,5]
    let secondStudent = [2,1,2,3,2,4,2,5]
    let thirdStudent = [3,3,1,1,2,2,4,4,5,5]
    
    var firstAnswerCount = 0
    var secondAnswerCount = 0
    var thirdAnswerCount = 0
    var manyAnswerStudents: [Int] = []
    
    for i in 0..<answers.count {
        let index = i % firstStudent.count
        if answers[i] == firstStudent[index] {
            firstAnswerCount += 1
        }
    }
    
    for i in 0..<answers.count {
        let index = i % secondStudent.count
        if answers[i] == secondStudent[index] {
            secondAnswerCount += 1
        }
    }
    
    for i in 0..<answers.count {
        let index = i % thirdStudent.count
        if answers[i] == thirdStudent[index] {
            thirdAnswerCount += 1
        }
    }
    
    var biggestCount = firstAnswerCount >= secondAnswerCount ? firstAnswerCount : secondAnswerCount
    biggestCount = biggestCount >= thirdAnswerCount ? biggestCount : thirdAnswerCount
    
    if biggestCount == firstAnswerCount {
        manyAnswerStudents.append(1)
    }
    
    if biggestCount == secondAnswerCount {
        manyAnswerStudents.append(2)
    }
    
    if biggestCount == thirdAnswerCount {
        manyAnswerStudents.append(3)
    }
    
    return manyAnswerStudents
}

solution([1,2,3,4,5])
solution([1,3,2,4,2])

// MARK: 다른 사람 풀이 볼 것
