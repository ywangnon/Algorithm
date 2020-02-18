# 빅오 표기법, 시간 복잡도, 공간 복잡도



## big-O

알고리즘의 효율성을 나타내는 지표

## 시간 복잡도

big-O의 시간 개념

알고리즘의 수행 시간 

데이터의 입력을 충분히 큰 것으로 가정

> **상수항 무시**
> $$
> O(2N) -> O(N)\\
> O(N^2 + 2) -> O(N^2)
> $$
> **영향력 없는 항 무시**
> $$
> O(N^2 + N) -> O(N^2)\\
> O(N^2)이 가장 지배적이기 때문에 그 외에 영향력이 없는 항들은 무시합니다.
> $$

자주 사용되는 big-O

> $$
> O(1) < O(log n) < O(n) < O(n log n) < O(n^2) < O(2^n) < O(n!) < O(n^n) 
> $$

예제

- 입력값 10, 결과값 100

**O(1)**

```swift
func sum1(n: Int) -> Int {
	return n * n
}
```

**O(N)**

```swift
func sum2(n: Int) -> Int {
  var sum = 0
  for 1 in n {
    sum += n
  }
  return sum
}
```

**O(N^2)**

```swift
func sum3(n: Int) -> Int {
  var sum = 0
  for 1 in n {
    for 1 in n {
      sum += 1
    }
  }
  return sum
}
```



## 공간 복잡도

big-O의 공간 개념

알고리즘의 공간 필요 정도 

> 크기 N인 배열 O(N)
>
> 크기 N x N인 배열 O(N^2)

예제

- 1부터 n까지의 합

**O(N)**

```swift
func sum(n: Int) -> Int {
  var sum = 0
  if n < 1 {
    return 0
  }
  return n + sum(n-1)
}
```

**O(1)**

```swift
func mainSum(n: Int) -> Int {
  var result = 0
  for 0 in n {
    result += sum(i, i + 1)
  }
  return result
}

func sum(a: Int, b: Int) -> Int {
  return a + b
}
```



## 참고자료

https://cjh5414.github.io/big-o-notation/