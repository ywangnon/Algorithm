# 🔄 Queues & Stacks in Swift

Swift에서의 스택과 큐 자료구조 구현 및 시간 복잡도 정리입니다.

---

## 📦 Stack (스택)

> **LIFO (Last-In First-Out)** 구조

---

### ✅ 구현 (Swift)

```swift
public struct Stack<T> {
    fileprivate var array = [T]()

    public var isEmpty: Bool { array.isEmpty }
    public var count: Int { array.count }

    public mutating func push(_ element: T) {
        array.append(element)
    }

    public mutating func pop() -> T? {
        return array.popLast()
    }

    public var top: T? {
        return array.last
    }
}
```

---

### ⏱️ 시간 복잡도

| 연산                 | 복잡도  |
| ------------------ | ---- |
| `push`             | O(1) |
| `pop`              | O(1) |
| `top`              | O(1) |
| `isEmpty`, `count` | O(1) |

---

### 💡 특징

* 새로운 요소는 배열 **끝에 삽입** → O(1)
* 시작 부분 삽입 시 O(n) 발생 (주의)
* **함수 호출 스택**에 사용됨

  * 함수가 호출될 때, **반환 주소**를 스택에 저장
  * 재귀가 너무 깊으면 **스택 오버플로우** 발생

---

## 🧮 Queue (큐)

> **FIFO (First-In First-Out)** 구조

---

### ✅ 기본 구현

```swift
public struct Queue<T> {
    fileprivate var array = [T]()

    public var isEmpty: Bool { array.isEmpty }
    public var count: Int { array.count }

    public mutating func enqueue(_ element: T) {
        array.append(element)
    }

    public mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }

    public var front: T? {
        return array.first
    }
}
```

---

### ⛔ 단점

| 연산        | 복잡도  | 설명                   |
| --------- | ---- | -------------------- |
| `enqueue` | O(1) | 배열 끝에 추가             |
| `dequeue` | O(n) | 앞 요소 제거 시 나머지를 모두 이동 |

---

## ⚡ 개선된 Queue (헤드 인덱스 방식)

> 앞 요소를 `nil`로 바꾸고, 필요할 때만 배열 압축

---

### ✅ 효율적 구현

```swift
public struct Queue<T> {
    fileprivate var array = [T?]()
    fileprivate var head = 0

    public var isEmpty: Bool { count == 0 }
    public var count: Int { array.count - head }

    public mutating func enqueue(_ element: T) {
        array.append(element)
    }

    public mutating func dequeue() -> T? {
        guard head < array.count, let element = array[head] else { return nil }

        array[head] = nil
        head += 1

        // 메모리 최적화: 배열 사용률 25% 이하일 때 압축
        if array.count > 50 && Double(head)/Double(array.count) > 0.25 {
            array.removeFirst(head)
            head = 0
        }

        return element
    }

    public var front: T? {
        return isEmpty ? nil : array[head]
    }
}
```

---

### ⏱️ 시간 복잡도 (평균)

| 연산                 | 복잡도  |
| ------------------ | ---- |
| `enqueue`          | O(1) |
| `dequeue`          | O(1) |
| `front`            | O(1) |
| `isEmpty`, `count` | O(1) |

---

### 🧠 핵심 아이디어

* `dequeue` 시 요소를 삭제하지 않고 `nil` 처리
* **head 포인터**로 실제 시작점을 추적
* **사용률이 낮을 때만 배열 압축** → 시간 복잡도 평균 O(1) 유지

---

## 🧾 참고 요약

| 자료구조  | 특징   | 주요 구현 전략                  |
| ----- | ---- | ------------------------- |
| Stack | LIFO | 배열 끝에 append/pop          |
| Queue | FIFO | 앞에서 제거, 효율 위해 head 포인터 사용 |
