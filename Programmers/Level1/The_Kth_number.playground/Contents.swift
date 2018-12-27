//: Playground - noun: a place where people can play

import UIKit


func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    
    var resultArray: Array<Int> = []
    
    for i in 0..<commands.count {
        let start = array.index(array.startIndex, offsetBy: commands[i][0]-1)
        let end = array.index (array.startIndex, offsetBy: commands[i][1]-1)
        let midArray = array[start...end].sorted()
        resultArray.append(midArray[commands[i][2]-1])
    }
    
    return resultArray
}


func solution2(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    
    var resultArr: [Int] = []
    
    for arr in commands {
        resultArr.append(array[(arr[0]-1)...(arr[1]-1)].sorted()[arr[2]-1])
    }
    
    return resultArr
}


solution2([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]])

/*
let arr = [1, 5, 2, 6, 3, 7, 4]
let start = arr.index(arr.startIndex, offsetBy: 2-1)
let end = arr.index(arr.startIndex, offsetBy: 5-1)
let midArr = arr[start...end].sorted()
midArr[3-1]
*/
