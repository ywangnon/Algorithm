## 📱 1. 시간/공간 복잡도 시각화 SwiftUI 앱

### 🔸 앱 개요

* 시간/공간 복잡도의 성장을 **애니메이션 기반 그래프로 시각화**
* 다양한 Big-O 곡선을 **입력 크기 N**에 따라 보여줌
* 사용자가 N 값을 슬라이더로 조절하며 효과 확인 가능

### 🔧 주요 기능

| 기능       | 설명                                              |
| -------- | ----------------------------------------------- |
| Big-O 선택 | O(1), O(logN), O(N), O(N log N), O(N²), O(2ⁿ) 등 |
| N 조절     | 슬라이더로 입력 크기 변경                                  |
| 그래프 보기   | 시간 복잡도 함수의 변화량 애니메이션                            |
| 모드 전환    | 시간 복잡도 vs 공간 복잡도 시각화 선택                         |

---

### ✅ SwiftUI 기본 틀 예시

```swift
struct ComplexityGraphView: View {
    @State private var n: Double = 10
    @State private var selectedFunction: String = "O(n)"

    let functions: [String: (Double) -> Double] = [
        "O(1)": { _ in 1 },
        "O(log n)": { n in log2(n) },
        "O(n)": { n in n },
        "O(n log n)": { n in n * log2(n) },
        "O(n²)": { n in n * n },
        "O(2^n)": { n in pow(2, n) }
    ]

    var body: some View {
        VStack {
            Picker("함수", selection: $selectedFunction) {
                ForEach(Array(functions.keys), id: \.self) { key in
                    Text(key)
                }
            }
            .pickerStyle(SegmentedPickerStyle())

            Slider(value: $n, in: 1...20, step: 1)
            Text("N = \(Int(n))")

            GeometryReader { geo in
                Path { path in
                    let maxN = 20.0
                    let step = maxN / Double(geo.size.width)
                    var x = 0.0

                    while x < maxN {
                        let y = functions[selectedFunction]?(x) ?? 0
                        let px = x / maxN * geo.size.width
                        let py = geo.size.height - min(geo.size.height, CGFloat(y) * 5)

                        if x == 0 {
                            path.move(to: CGPoint(x: px, y: py))
                        } else {
                            path.addLine(to: CGPoint(x: px, y: py))
                        }
                        x += step
                    }
                }
                .stroke(Color.blue, lineWidth: 2)
            }
            .frame(height: 200)
        }
        .padding()
    }
}
```

---

## 📊 2. 실전 문제별 Big-O 분석 정리

| 문제 유형            | 예시 문제             | 시간 복잡도     | 이유                      |
| ---------------- | ----------------- | ---------- | ----------------------- |
| 배열 순회            | 합계 구하기            | O(N)       | 요소 1개씩 순회               |
| 중복 제거 (Set)      | 배열 중복 제거          | O(N)       | Set은 평균 O(1)            |
| 이진 탐색            | 특정 값 찾기 (정렬된 배열)  | O(log N)   | 반씩 줄이므로 로그              |
| 정렬 후 탐색          | 정렬 + 두 포인터        | O(N log N) | 정렬 O(N log N) + 탐색 O(N) |
| 중첩 반복            | 이중 for문 (좌표 비교 등) | O(N²)      | 모든 쌍 확인                 |
| DFS/BFS 탐색       | 미로 탐색, 섬의 개수      | O(N × M)   | 전체 격자 탐색                |
| 백트래킹             | N-Queens, 순열      | O(N!)      | 모든 순열 탐색                |
| DP (메모이제이션)      | 피보나치, 계단 오르기      | O(N)       | 중복 호출 제거                |
| 최단 경로 (Dijkstra) | 다익스트라 알고리즘        | O(E log V) | 우선순위 큐 사용               |

---

## 🔍 3. O(N log N) 알고리즘 유형 정리

### 📌 주요 알고리즘

| 알고리즘                | 시간 복잡도          | 설명                  |
| ------------------- | --------------- | ------------------- |
| Merge Sort (병합 정렬)  | O(N log N)      | Divide & Conquer 방식 |
| Heap Sort           | O(N log N)      | 힙 트리를 기반으로 정렬       |
| Quick Sort 평균       | O(N log N)      | 피벗 기준 재귀 분할         |
| Dijkstra (heap 사용)  | O(E log V)      | 간선 수 E, 우선순위 큐 사용   |
| Segment Tree        | O(log N) per op | 구간합, 최댓값 질의         |
| Binary Indexed Tree | O(log N) per op | 누적합, 수정에 빠름         |
| K번째 수 (정렬 후 인덱싱)    | O(N log N)      | 정렬 + 인덱싱            |
| 최소 스패닝 트리 (Kruskal) | O(E log E)      | 간선 정렬 + 유니온파인드      |

---

### ✅ 예시: Merge Sort (Swift)

```swift
func mergeSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }

    let middle = array.count / 2
    let left = mergeSort(Array(array[0..<middle]))
    let right = mergeSort(Array(array[middle..<array.count]))

    return merge(left, right)
}

func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var result: [Int] = []
    var l = 0, r = 0

    while l < left.count && r < right.count {
        if left[l] < right[r] {
            result.append(left[l])
            l += 1
        } else {
            result.append(right[r])
            r += 1
        }
    }

    result += left[l...]
    result += right[r...]
    return result
}
```

---

## 📌 마무리 정리

* SwiftUI를 통해 **Big-O 시각화 앱** 제작 가능 (교육용으로 강력함)
* 코딩 테스트 준비 시 **문제별 시간 복잡도 분류표**는 필수
* `O(N log N)`은 성능과 효율의 타협점 → 주력 알고리즘 숙지 필요
