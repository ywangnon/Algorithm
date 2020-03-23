# Queues

## Stack

- Last-in, first-out!

### 구현

```swift
public struct Stack<T> {
  fileprivate var array = [T]()

  public var isEmpty: Bool {
    return array.isEmpty
  }

  public var count: Int {
    return array.count
  }

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

### 특징

- 새로운 요소를 배열의 끝에 놓음
  - 시작 부분에 삽입시: O(n): 기존 요소를 모두 이동
  - 끝 부분에 삽입시: O(1)
- 주의: 
  1. function, method 호출 시 CPU는 반환 주소를 스택에 배치.
  2. 함수 종료시, CPU는 반환 주소를 사용하여 호출자에게로 다시 이동.
  3. 따라서 너무 많은 함수 혹은 끝이 없는 재귀 함수 호출 시, CPU 스택에 공간이 부족해져서 '스택오버플로'가 발생.

## Queue

- First-in, first-out!

### 구현

```swift
public struct Queue<T> {
  fileprivate var array = [T]()

  public var isEmpty: Bool {
    return array.isEmpty
  }
  
  public var count: Int {
    return array.count
  }

  public mutating func enqueue(_ element: T) {
    array.append(element)
  }
  
  public mutating func dequeue() -> T? {
    if isEmpty {
      return nil
    } else {
      return array.removeFirst()
    }
  }
  
  public var front: T? {
    return array.first
  }
}
```

- enqueueing: O(1):
  - 배열 끝에 새로운 요소 삽입
  - 평소에는 사용되지 않는 빈 배열의 수가 정해져있음.
  - 사용되지 않는 빈 배열이 다 차면 더 큰 공간을 확보하기 위해 새로운 메모리 할당 및 새 배열로 복사하는 작업(O(n)) 진행
  - 위 작업은 때때로 발생하므로 평균 O(1)
- dequeueing: O(n)
  - 배열의 시작 부분에서 요소를 제거
  - 나머지 모든 배열 요소를 이동해야하므로 O(n)
  
  


















