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
  
### 좀 더 효율적으로!
  
- dequeueing이 일어날 때마다 O(n)의 작업을 하는 것은 비효율적
- main Idea: dequeueing할 시 dequeueing된 위치를 제거하지 말고 빈 배열로 바꿈
- 결론적으로는 dequeueing으로 생긴 배열의 앞부분 빈 배열을 없애고 요소들을 당겨주는 작업을 해야함
- 당겨주는 작업은 때때로 발생하므로 평균 O(1)
  
  
```swift
public struct Queue<T> {
  fileprivate var array = [T?]()
  fileprivate var head = 0
  
  public var isEmpty: Bool {
    return count == 0
  }

  public var count: Int {
    return array.count - head
  }
  
  public mutating func enqueue(_ element: T) {
    array.append(element)
  }
  
  public mutating func dequeue() -> T? {
    guard head < array.count, let element = array[head] else { return nil }

    array[head] = nil
    head += 1

    let percentage = Double(head)/Double(array.count)
    if array.count > 50 && percentage > 0.25 {
      array.removeFirst(head)
      head = 0
    }
    
    return element
  }
  
  public var front: T? {
    if isEmpty {
      return nil
    } else {
      return array[head]
    }
  }
}
```

- head를 넣어 맨 처음 요소를 설정하고 dequeueing시 앞 배열을 nil로 바꾸고 head 증가시킴
- head를 재설정하지 않으면 배열이 커지기때문에 일정 조건이 해당시 head를 재설정
















