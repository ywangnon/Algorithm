//: Playground - noun: a place where people can play

import UIKit
import Foundation

let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
let (a, b) = (n[0], n[1])

for line in 0..<b {
    for count in 0..<a {
        print("*", terminator: "")
    }
    print("")
}
