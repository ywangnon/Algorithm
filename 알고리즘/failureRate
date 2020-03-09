//    var answer: [Int:Float] = [:]
//    var stages = stages
//    for i in 1...N {
//        let max = stages.count
//        if max == 0 {
//            answer.updateValue(0, forKey: i)
//        } else {
//            stages = stages.filter { $0 > i }
//            let rate = Float(max - stages.count) / Float(max)
//            answer.updateValue(rate, forKey: i)
//        }
//    }
//
////    temp
////        .sorted(by: { (arg0, arg1) -> Bool in
////            if arg0.value == arg1.value {
////                return arg0.key < arg1.key
////            } else {
////                return arg0.value > arg1.value
////        }})
////        .map { $0.key }
//    return answer.sorted(by: <).sorted(by: { $0.value > $1.value }).map{ $0.key }

// for문 안에서 filter를 사용함으로써 O(N^2)이 되어 시간 초과됨
// 추후 수정
