/*:
 # 행렬의 덧셈
 
 ## 문제 설명
 
 행렬의 덧셈은 행과 열의 크기가 같은 두 행렬의 같은 행, 같은 열의 값을 서로 더한 결과가 됩니다. 2개의 행렬 arr1과 arr2를 입력받아, 행렬 덧셈의 결과를 반환하는 함수, solution을 완성해주세요.
 
 ## 제한 조건
 
 - 행렬 arr1, arr2의 행과 열의 길이는 500을 넘지 않습니다.
 
 ## 입출력 예
 
 arr1    arr2    return
 
 [[1,2],[2,3]]    [[3,4],[5,6]]    [[4,6],[7,9]]
 
 [[1],[2]]    [[3],[4]]    [[4],[6]]
 */

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var arr: [[Int]] = []
    
    for n in 0..<arr1.count {
        var temp:[Int] = []
        for m in 0..<arr1[n].count {
            temp.append(arr1[n][m] + arr2[n][m])
        }
        arr.append(temp)
    }
    
    return arr
}

print("\n---------- [ 다른 사람의 풀이 ] ----------\n")

func solution2(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var arr3:[[Int]] = Array(repeating:Array(repeating:0, count:arr1[0].count), count:arr1.count)
    for i in 0..<arr1.count {
        for j in 0..<arr1[i].count {
            arr3[i][j] = arr1[i][j] + arr2[i][j]
        }
    }
    return arr3
}

/********************************************
 미리 전체 배열을 0으로 채워서 만든 후 덧셈을 하였다.
 ********************************************/
