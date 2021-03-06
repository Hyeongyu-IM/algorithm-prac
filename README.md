# algorithm-prac
###풀이파일 주소 (https://github.com/Hyeongyu-IM/Campus-Leture/tree/master/practice.playground)

## 알고리즘 문제 리뷰. 프로그래머스 레벨 1 ( 2020.11.08 ~ 2020.11.15 )

### 1. 비밀지도( [https://memohg.tistory.com/99?category=884219](https://memohg.tistory.com/99?category=884219) )

```swift
func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    var result = ""
    for i in 0..<arr1.count {
        let c = String(arr1[i] | arr2[i], radix: 2)
        for q in c {
           if q == "1" {
               result += "#"
           } else {
               result += " "
           }
        }
        if result.count < n {
            for _ in 0 ... n - result.count - 1 {
                result = " \(result)"
            }
        }
        answer.append(result)
        result = ""
    }
    return answer
}
```

- 숫자를 이진수로 변환할때 정수를 두개를 , 를 기준점으로 같이 넣게  되면 같은자리에 0과 1이 만나게되면 1이 되게된다. 따라서 0 0일 때를 제외하고는 결과값을 쉽게 얻을수 있다.
- 또한 이렇게 치환한 값의 길이가 짧을 경우를 대비해서 원래의 길이보다 작을 경우 작은만큼 앞에 공백을 추가해 주었다.

### 2. 실패율 ( [https://memohg.tistory.com/100?category=884219](https://memohg.tistory.com/100?category=884219) )

```swift
func solution(_ N:Int, _ stages:[Int]) -> [(Int)] {
    var countPerson = [(Int, Int)]()
    var get = [(Int, Double)]()
    var stageCount = stages.count
    var result = [Int]()

    for i in 1...N{
        let result: Int = stages.filter { $0 == i }.count
        countPerson.append((i, result))
    }
    // countPerson 예시 [(1, 1), (2, 3), (3, 2), (4, 1), (5, 0)]

    for i in 0..<countPerson.count {
        if stageCount != 0 {
        var sum: Double = Double(countPerson[i].1) / Double(stageCount)
        stageCount -= countPerson[i].1
        get.append((countPerson[i].0, sum))
        } else {
            get.append((countPerson[i].0, 0))
        }
    }
    //get예시 [(1, 0.125), (2, 0.42857142857142855), (3, 0.5), (4, 0.5), (5, 0.0)]

   get.sorted{
          if $0.1 == $1.1 {
              return $0.0 < $1.0
           }else {
              return $0.1 > $1.1
           }
    }.map { result.append($0.0)}

    return result //[3, 4, 2, 1, 5]
}

solution(5, [2,1,2,6,2,4,3,3])
```

- 어떻게 풀이할지는 계획을 쉽게 세웟으나 풀이를 써내려가는 조건이 생각하기 좀 어려웠습니다...
- 각 스테이지별로 머무르는 유저수를 구해서 전체 유저에서 차례대로 빼가면서 실패율을 계산했습니다.
- 만약 5개의 스테이지중 아직 도달하지 못한 스테이지가 있을수도 있기때문에 만약 전체 유저수에서 차례로 빼오던 값이 0이 될경우 실패율을 계산할수 없으므로 해당 스테이지에 0을 입력하였습니다.

### 3. 다트 게임 ( [https://memohg.tistory.com/103?category=884219](https://memohg.tistory.com/103?category=884219) )

```swift
func solution(_ dartResult:String) -> Int {
    var scores: [Int] = [Int](repeating: 0, count: 3)

    var idx: Int = -1
    var beforeChar: Character = " "
    for char in dartResult {
        switch char {
        case "0"..."9":
            if beforeChar == "1" {
                scores[idx] = 10
            } else {
                idx += 1
                scores[idx] = Int(String(char))!
            }
        case "D":
            scores[idx] = scores[idx] * scores[idx]
        case "T":
            scores[idx] = scores[idx] * scores[idx] * scores[idx]
        case "*":
            if idx < 1 {
                scores[idx] *= 2
            } else {
                scores[idx-1] *= 2
                scores[idx] *= 2
            }
        case "#":
            scores[idx] *= -1
        default:
            break
        }
        beforeChar = char
    }

    return scores.reduce(0, +)
}
```

- 이번 문제는 음... 이렇게 하면되겠군 하고 풀다가 10을 생각 못하고 .. 멘탈이 무너져 검색으로 해결한 문제입니다. 이 문제가 레벨 1 마지막 문제였는데 다음날 다시 시도해서 혼자 풀어 보았습니다
- 주된 핵심사항은 반복문을 돌릴때 정수일때 인덱스를 한칸 이동시킵니다 저는 바보같이 기준을 0으로 두었었는데 어떻게 하나 한참 고민했었는데... 그냥 -1을 선언하면 되는 것였네요;;;
- 그리고 마지막에는 들어왔던 문자열을 저장해서 다음판별에 만약 정수가 1이였을경우 또다시 정수가 들어올경우 무조건 10이 들어오므로 10을 넣어주게 구현했습니다.
- 그리고 이문제를 검색으로 해결한 것이 다행이였던것이 저는 * 조건을 바로전 점수만 해당하는것이 아니라 3번째에 * 들어 있으면 이전점수 모두를 각각 *2하는줄 알았는데 아니였네요... 다시한번 조건을 잘 읽어보고 숙지해야함을 깨달은 문제였습니다.

## 알고리즘 문제 리뷰. 프로그래머스 레벨 1 ( 2020.11.02 ~ 2020.11.08 )

### 1. 하샤드 수 ( [https://memohg.tistory.com/89?category=884219](https://memohg.tistory.com/90?category=884219) )

- 문제에 하샤드 수의 조건이 표시되어있어서 어렵지 않았습니다.

```swift
func solution(_ x:Int) -> Bool {
    return x % String(x).map{String($0)}.reduce(0){$0 + Int($1)!} == 0 ? true : false
}
```

### 2. 핸드폰 번호 가리기 ( [https://memohg.tistory.com/91?category=884219](https://memohg.tistory.com/91?category=884219) )

- 다른 분의 풀이가 인상적이였습니다. 문자열 다루기의 진수를 볼수있었습니다.

    ```swift
    String(repeating:"*", count:phone_number.count-4)+phone_number.suffix(4)
    ```

### 3. 행렬의 덧셈 ( [https://memohg.tistory.com/93?category=884219](https://memohg.tistory.com/93?category=884219) )

- 문제 자체는 조금만 생각해보면 어렵지않게 풀수있는 문제였지만 맵을 활용하고 싶었으나 포기한문제...

```swift
// 인상깊은 풀이
func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    return zip(arr1, arr2).map{zip($0,$1).map{$0+$1}}
}
```

### 4. x만큼 간격이 있는 n개의 숫자 ( [https://memohg.tistory.com/95?category=884219](https://memohg.tistory.com/95?category=884219) )

- 배열을 어떻게 만들고 시작할까... 에서 좀더 나아가서 맵을 이용했으면 하는 아쉬움이 있던 문제였습니다.

    ```swift
    // 나의 풀이
    func solution(_ x:Int, _ n:Int) -> [Int64] {
        var result: [Int64] = []
        for index in 1...n {
            result.append(Int64(index * x))
        }
        return result
    }

    // 인상깊은 풀이
    func solution(_ x:Int, _ n:Int) -> [Int64] {
        return Array(1...n).map { Int64($0 * x) }
    }
    ```

### 5. 내적 ( [https://memohg.tistory.com/96?category=884219](https://memohg.tistory.com/96?category=884219) )

- 이번 문제는 숫자가 하나로 도출되어서 아 이건 리듀스가 가능하겠구나 했지만 ... 어떻게 할지 생각하다가 포기했는데 어떤분이 하신게 있었다는...

    removeFirst() 의 리턴값이 삭제되는 숫자라는것을 이용한 풀이여서 인상깊었습니다.

    ```swift
    // 나의풀이
    func solution(_ a:[Int], _ b:[Int]) -> Int {
        var result = 0
        for i in 0..<a.count {
            result += a[i] * b[i]
        }
        return result
    }

     // 인상깊은 풀이
    func solution(_ a:[Int], _ b:[Int]) -> Int {
        var b = b
        return a.map{ $0 * b.removeFirst()}.reduce(0,+)
    }
    ```

### 6. 예산 ( [https://memohg.tistory.com/97?category=884219](https://memohg.tistory.com/97?category=884219) )

- 어떻게 풀면 될지 잠깐 고민했으나 정렬을 이용하면 쉽게 풀수있었습니다.
- 고차함수를 잘이용해야 사람이 멋있게 보이는것 같습니다.

    ```swift
    // 나의 풀이
    func solution(_ d:[Int], _ budget:Int) -> Int {
        var bud = budget
        let arrayd = d.sorted()
        var count = 0
        for i in arrayd {
            if bud >= i {
                bud -= i
                count += 1
            } 
        }
        return count
    }

    // 인상 깊은 풀이
    func solution(_ d:[Int], _ budget:Int) -> Int {
        var budget = budget

        return d.sorted().filter{
            budget = budget - $0
            return budget >= 0
        }.count
    }
    ```

### 7. 직사각형 별찍기 ( [https://memohg.tistory.com/98?category=884219](https://memohg.tistory.com/98?category=884219) )

- 갑작스레 등장한 입력받고 로그 찍기 문제 였지만 어렵지 않게 잘 해결하였습니다

    ```swift
    let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
    let (a, b) = (n[0], n[1])
    var star = String(repeating:"*", count: a)
    var space = String(repeating:"\(star)\n", count: b)
    print(space)
    ```

## 알고리즘 문제 리뷰. 프로그래머스 레벨 1 ( 2020.10.26 ~ 2020.11.01 )

### 1. 평균 구하기 ( [https://memohg.tistory.com/89?category=884219](https://memohg.tistory.com/89?category=884219) )

- 문제 자체는 어려운게 없었고 새로 습득한 지식은 정수와 더블의 연산으로는 더블이 리턴될수 없다는것
- 더블 / 더블 을 해야 더블이 리턴된다

    ```swift
    func solution(_ arr:[Int]) -> Double {
        return Double(arr.reduce(0,+))/Double(arr.count)
    }
    ```

### 2. 콜라츠 추측 ( [https://memohg.tistory.com/87?category=884219](https://memohg.tistory.com/87?category=884219) )

- 수식이 이미 문제에 제시되었었기 때문에 그대로 구현했고 다만 조건의 우선순위를 판단하는것이 중요한 문제였다.

### 3. 최대공약수와 최소공배수 ( [https://memohg.tistory.com/85?category=884219](https://memohg.tistory.com/85?category=884219) )

- 최대공약수, 최소공배수를 구하는 공식을 찾아 해결하였으며 인상깊은 코드를 작성한것을 보고 따라했습니다.
    - 최대공약수 공식
        - 숫자1 % 숫자 2 == 0 ? 둘중최소값(숫자1, 숫자2) : 없으면 다시(숫자2, 숫자1 % 숫자2)
    - 최소공배수 공식
        - (숫자1 * 숫자2) / 최대공약수

    ```swift
    // 가장 작은수로 나누어 떨어질때까지 반복
    func gcd(_ num: Int, _ num2: Int) -> Int {
        let mod: Int = num % num2
        return 0 == mod ? min(num, num2) : gcd(num2, mod)
    }
     
    // 최대공약수로 두숫자를 곱한값을 나누면 최소공배수
    func lcm(_ a: Int, _ b: Int) -> Int {
        return a * b / gcd(a, b)
    }
     
    func solution(_ n:Int, _ m:Int) -> [Int] {
        return [gcd(n, m), lcm(n, m)]
    }
    ```

### 4. 키패드 누르기 ( [https://memohg.tistory.com/82?category=884219](https://memohg.tistory.com/82?category=884219) )

- 이번주 문제중에 가장높은 난이도에 가장많은 시간을 투자한 문제입니다.
- 약 한시간가량을 좌표값없이 해보다가 안되는것을 깨닫고 `좌표값과 절대값을 이용`하여 풀었습니다.
    - 문제의 핵심사항에 왼손잡이, 오른손잡이 별로 조건을 설정하는것도 어려웠습니다.

    ```swift
    import Foundation

    func solution(_ numbers:[Int], _ hand:String) -> String {
        let mapArray:[(Int, Int)] = [(3, 1),(0, 0),(0, 1),(0, 2)
                                     ,(1, 0),(1, 1),(1, 2),(2, 0),
                                     (2, 1),(2, 2),(3, 0),(3, 2)]
                                     
        func index (current: (Int, Int), point: (Int, Int)) -> Int {
            return abs(abs(current.0 - point.0) + abs(current.1 - point.1))
        }

        var lefthand = mapArray[10]
        var righthand = mapArray[11]
        var result = ""

        for num in numbers {
            if num == 1 || num == 4 || num == 7 {
                result += "L"
                lefthand = mapArray[num]
            } else if num == 3 || num == 6 || num == 9 {
                result += "R"
                righthand = mapArray[num]
            } else if num == 2 || num == 5 || num == 8 || num == 0 {
               let leftindex = index(current: lefthand, point: mapArray[num])
               let rightindex = index(current: righthand, point: mapArray[num])
                if hand == "right" {
                    if leftindex >= rightindex {
                        result += "R"
                        righthand = mapArray[num]
                    } else {
                        result += "L"
                        lefthand = mapArray[num]
                    }
                } else {
                    if leftindex <= rightindex {
                        result += "L"
                        lefthand = mapArray[num]
                    } else {
                        result += "R"
                        righthand = mapArray[num]
                    }
                }
            }
        }
        return result
    }
    ```

### 5. 짝수와 홀수

- 가장 쉬운 문제였습니다.

    ```swift
    func solution(_ num:Int) -> String {
        return num % 2 == 0 ? "Even" : "Odd"
    }
    ```

### 6. 제일 작은 수 제거하기

- 배열안의 숫자중에 가장작은 숫자를 빼는 문제였습니다
- 이문제를 풀고 알게 되었던것이 컴팩트 맵은 변환과정에서 nil을 포함하지 않고 옵셔널 에러를 발생시키지 않는 다는 것을 알았습니다.
- 저는 그냥 정렬한다음 제일앞에있는 수를 빼는 식으로 풀었습니다.

    ```swift
    //나의 풀이
    func solution(_ arr:[Int]) -> [Int] {
        var arr = arr
       if arr.count <= 1 {
           return [-1]
       } else{
       let smaller = arr.sorted()[0]
        arr.remove(at: arr.firstIndex(of: smaller)!)
        return arr
       }
    }

    // 인상깊은 풀이
    func solution(_ arr:[Int]) -> [Int] {
        let min = arr.sorted(by: <)[0]
         return arr.count == 1 ? [-1] : arr.compactMap({ return $0 != min ? $0 : nil })
    }
    ```

### 7. 정수 제곱근 판별

- 제곱근 공식을 보면서 그대로 풀이하였고 풀이한다음 `sqrt`란 메서드를 보고 깨달은 문제입니다.

    ```swift
    // 인상깊은 풀이
    func solution(_ n:Int64) -> Int64 {
        let x = Int64(sqrt(Double(n)))
        return (x * x == n) ? ((x + 1) * (x + 1)) : -1
    }

       // 나의풀이
    func solution(_ n:Int64) -> Int64 {
        let x: Int = 1
        while x*x == n {
            if x*x == n {
                return Int64((x+1)*(x+1))
            }
        }
        return -1
    }
    ```

## 알고리즘 문제 리뷰. 프로그래머스 레벨 1 (2020.10.12 ~ 2020.10.25 )

### 문자열 내 p와 y의 개수([https://memohg.tistory.com/54](https://memohg.tistory.com/54))

- 간단하게 사용한 메서드는 `lowercased()` , `filter`, `count`
- 인상깊었던 풀이

    ```swift
    func solution(_ s:String) -> Bool
    {
        let string = s.lowercased()
        return string.components(separatedBy: "p").count == string.components(separatedBy: "y").count
    }
    ```

### 2. 3진수 뒤집기([https://memohg.tistory.com/56?category=884219](https://memohg.tistory.com/56?category=884219))

- 문제는 간단하게 10진수였던 수를 3진수로 바꾸고 바꾼 숫자를 뒤집고 뒤집은 숫자를 다시 10진법으로 표현하는 것이였다.
- Swift에서 진수 표현은 문자열에만 허용되어서 들어온 정수를 문자열로 바꾸고
- `String(정수, radix: n진수)` // n은 진수를 의미한다
- 문자열을 정수로 바꿀때는 옵셔널 타입이므로 !를 붙여서 타입 캐스팅 해주어야한다.
- 여기서 한참 해맷던것은 10진수를 3진수로 바꾸면 3진수였던 수는 10진법으로 바꾸어야하니까 n진수에 자꾸 10이라고 적어서 ... 3진수였던 숫자도 3진수로 표현하려면 n에 3을 넣었어야했는데... 바보....

### 3. 문자열 내림차순으로 배치하기([https://memohg.tistory.com/57?category=884219](https://memohg.tistory.com/57?category=884219))

- 문제는 간단하게 입력된 알파벳을 대문자는 맨뒤로 소문자는 알파벳 역순으로 정렬하는 것이였는데 ...
- 복잡하게 생각해서 필터쓰고 lowercase uppercase다쓰고 난리쳤는데 아니 나는... 알파벳도 알아서 정렬되고 대문자도 정렬이 따로 되는지 몰랐지... 모른게 죄다.

    ```swift
    func solution(_ s:String) -> String {
        return String(s.sorted(by: >))
    }
    ```

### 4. 문자열 다루기 기본([https://memohg.tistory.com/59?category=884219](https://memohg.tistory.com/59?category=884219))

- 문제는 길이가 4혹은 6이고 숫자로만 구성되어 있는지 확인하는 코드를 짜는 것이였는데.
- 내가 구현한 코드는 `s.filter { num.firstIndex(of: $0) != nil }` 이렇게 숫자인 배열을 따로 만들어서 숫자만 골라내고 길이가 같으면 true를 만드는 식을 구현했는데 풀고나서 다른사람이 구현한 것을 보니

    ```swift
    func solution(_ s:String) -> Bool {
        return (Int(s) != nil && (s.count == 4 || s.count == 6)) ? true : false
    }
    //어떻게 판별했나 보니 숫자만 있는 문자열이 아닌 문자열을 캐스팅 하면 nil이 나오게 되는것을 알았다.
    ```

    - 순수 숫자로만 구성된 문자열이 아니면 Int캐스팅을 하면 nil이 나오게 된다. 따라서 그 이후에는 길이가 4또는 6인지 확인만 하면 끝.

### 5. 소수 찾기([https://memohg.tistory.com/61?category=884219](https://memohg.tistory.com/61?category=884219))

- 입력된 숫자의 소수의 갯수를 반환하는 문제였는데 시간이 차.....암 오래 걸렸다
- 소수를 찾는 것은 간단하게 2부터 나누어지는 숫자가 있는지 확인하고 유일한 숫자인지를 찾으면 되는 것이였는데 간단하게 만약 3으로 나누어 지면 6이나 9는 소수가 될수없기에 배수를 없애주면서 확인하는 방법이여서 시간적 효율이 좋다.

    ```swift
    func solution1(_ n: Int) -> Int {
        var result = 0
        var array = Array.init(repeating: false, count: n+1)
        
        for i in 2...n {
            if (!array[i]){
                result += 1
                for j in stride(from: i, through: n, by: i) {
                   array[j] = true
                }
            }
        }
        return result
    }
    ```

    - 소수출력하고 싶다면 숫자를 카운트하고 다음 반복문이 들어가기전에 i를 다른배열에 append해주면 된다

### 6. 수박수박수박수...([https://memohg.tistory.com/62?category=884219](https://memohg.tistory.com/62?category=884219))

- 문제가 N만큼 수박수박의 길이를 리턴하는 것이였는데
- 그냥 길이만큼 만들고 짜르면 안되나 라고 간단히 생각했었는데 그것보다는
- 나머지를 활용해서 홀수면 수 짝수면 수 를 붙이는 걸로 했는데 나중에 풀이를 보니
- 인상깊은 코드가 있었다

    ```swift
    func solution(_ n:Int) -> String {
        return "\(String(repeating: "수박", count: n / 2))\(n % 2 == 0 ? "" : "수")"
    }
    ```

### 7. 문자열을 정수로 바꾸기( [https://memohg.tistory.com/64?category=884219](https://memohg.tistory.com/64?category=884219) )

- 입력받은 정수만 포함된 문자열을 숫자로 캐스팅 해주는 것이 문제였는데
- - 즉 음수를 포함해서 출력할수 있어야 한다고 해서 ㅇㅅㅇ? 그럼 판별하고 -붙여줘야하나 해서 그렇게 코드를 열심히 짜고 제출했더니 보인 코드 한줄

    `Int(s)!`       < 이렇게만해도 음수까지 출력됨 ㅎㅎ;

### 8. 시저 암호([https://memohg.tistory.com/67?category=884219](https://memohg.tistory.com/67?category=884219))

- 시저 암호는 알파벳을 지정된 숫자만큼 밀어서 해석하는 암호방식이다.
    - 나의코드

        ```swift
        func solution(_ s:String, _ n:Int) -> String {
            let lower = Array("abcdefghijklmnopqrstuvwxyz")
            let upper = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
            var arr = Array(s)

        for i in 0..<arr.count {
            if lower.contains(arr[i]) {
                let index = (lower.firstIndex(of: arr[i])!+n)%26
                arr[i] = lower[index]
            } else if upper.contains(arr[i]) {
                let index = (upper.firstIndex(of: arr[i])!+n)%26
                arr[i] = upper[index]
            }
        }
            return String(arr)
        }
        ```

        - 내가 선택한 방식은 미리 알파벳 대문자 소문자를 만들어두고 알파벳이 포함되면 그알파벳의 인덱스 값을 알아내서 이동시킨다음 새로운 문자를 입력해주는 방식이였다.
        - 인상깊은 코드

            ```swift
            func solution(_ s:String, _ n:Int) -> String {
                let alphabets = "abcdefghijklmnopqrstuvwxyz".map { $0 }
                return String(s.map {
                    guard let index = alphabets.firstIndex(of: Character($0.lowercased())) else { return $0 }
                    let letter = alphabets[(index + n) % alphabets.count]
                    return $0.isUppercase ? Character(letter.uppercased()) : letter
                })
            }

            여기서 인상깊었던것은 isUppercase 라는 대문자 판별 메서드가 있다는것.
            ```

### 9. 약수의 합( [https://memohg.tistory.com/68?category=884219](https://memohg.tistory.com/68?category=884219) )

- 약수의 합에 이용되는 루트를 이용한 방식이 있다고 하는데 너무 어려워서.... ㅠ
- 약수를 기본적으로 구하는 방법은 나누어 떨어져야 하는데 기본적으로 나누는 방식은 2로 나누어져야 의미가 있기때문에 나누는 범위를 들어온 숫자/2 로 줄여서 계산을 반을 줄였습니다.
- 그리고 나누어 떨어졌을때 같은 숫자가 있으면 안되기 때문에 Set을 사용했습니다.

    ```swift
    func solution(_ n:Int) -> Int {
       var result = Set<Int>()
        for i in 1...n/2 {
            if n % i == 0 {
                result.insert(i)
                if i != n/i {
                    result.insert(n/i)
                }
            }
        }
        return result.reduce(0,+)
    }
    // 1부터 시작한 이유는 n/2를 하기때문에 1이 들어가야 자기자신이 포함되어 나오기 때문입니다.
    // 그리고 i로 나누어지는 n은 어차피 n의 약수가 되기때문에 
    //1, 2, 4, 8은 8의 약수  만약 2가 i일때 8/i = 4가 되기때문에 4또한 8의 약수입니다.
    ```

### 10. 이상한 문자 만들기 ([https://memohg.tistory.com/69?category=884219](https://memohg.tistory.com/69?category=884219))

- 간단해 보였지만 간단하지 않았던 문제입니다
- 문자열의 인덱스를 기준으로 소문자 대문자로 만드는 것이였는데 중간에 공백까지 표현해주어야 해서 ㅠㅠ 힘들었습니다.
- 문제의 해법은 생각보다 간단했습니다. 먼저 인덱스가 0인 변수를 하나 만들어주고 짝수일때 대문자 홀수일때 소문자 그리고 각 변환이 실행될때마다 인덱스 +1 공백을 만나면 다시 인덱스 0. 머리가 좋아야 몸이고생을 덜... 크흠

    ```swift
    func solution(_ s:String) -> String {
    var index = 0
    let str = s.map { (str: Character) -> String in
            var result = ""
            if str != " " {
                if index % 2 == 0 {
                result = result + str.uppercased()
            } else {
                result = result + str.lowercased()
            }
                index += 1
            }else {
                index = 0
                result = result + " "
            }
            return result
        }
        return str.joined()
    }
    ```

### 11. 자릿수 더하기( [https://memohg.tistory.com/71?category=884219](https://memohg.tistory.com/71?category=884219) )

- 주어진 정수의 각 자릿수의 합을 구하는 문제입니다.

    ```swift
    func solution(_ n:Int) -> Int
    {
       return String(n).map{ String($0)}.reduce(0){ $0 + Int($1)! }
    }
    ```

    - 여기서 중요하게 생각해야 하는것은 리듀스의 활용입니다.
    - 여기서 초기값은 0으로 할당을 해주었기 때문에 $0에는 0인 정수가 자동으로 들어오고 두번째 값은 $1이 문자열이 들어오기때문에 캐스팅을 해주어야 했습니다.

### 12. 자연수 뒤집어 배열로 만들기( [https://memohg.tistory.com/72?category=884219](https://memohg.tistory.com/72?category=884219))

- 입력된 자연수를 뒤집어 배열로 만드는 문제입니다.

    ```swift
    func solution(_ n:Int64) -> [Int] {
        let arr = String(n).map { String($0) }
        var result = [Int]()
        for i in stride(from: arr.count-1, to: -1, by: -1) {
         result.append(Int(arr[i])!)
        }
        return result
    }
    ```

    - 입력된 정수를 문자열인 배열로 만들고.
    - 반대로 출력후 다시 정수로 캐스팅
    - 여기서 주의할점은 `stride`를 할때 to 는 자신을 포함하지 않습니다 .

### 13. 정수 내림차순으로 배치하기( [https://memohg.tistory.com/73?category=884219](https://memohg.tistory.com/73?category=884219))

- 입력받은 정수를 단순히 sorted하면 되는 내용이였습니다

    ```swift
    func solution(_ n:Int64) -> Int64 {
        return Int64(String(n).map{ String($0) }.sorted(by: >).joined())!
    }
    ```

## 알고리즘 문제 리뷰. 프로그래머스 레벨 1 Swift.( 2020.10.11 )
1. 두개 뽑아서 더하기([https://memohg.tistory.com/41?category=884219](https://memohg.tistory.com/41?category=884219))
    1. 배열이름.**`contains ()`** // Bool값이 리턴된다.
    2. 배열을 조회할때는 반복문에서 배열.카운트로 조회하기
    3. **`sorted()`** // 오름차순 정렬
    4. Set 을 사용하면 중복값을 없앨수 있다.
        - let set = `Set<Int>()` // 빈Set 만드는법
2. 크레인 인형뽑기 게임([https://memohg.tistory.com/42?category=884219](https://memohg.tistory.com/42?category=884219))
    1. 가장 중요한 개념. 입력되는 뽑기위치는 배열인덱스의 -1이다.
    2. 0을 만나면 **continue**
    3. 0이 아니라면 **break**
    4. 마지막 숫자와 같다면 카운트 +2 숫자빼기.
    5. **guard**를 사용해서 특정 조건을 만족하지 않으면 `continue`.
    특정 조건을 만족한다면 `break`
    6. 매개변수는 변경할수 없으므로 새로운 변수에 담아준다(복사)
3. K번째 수 ([https://memohg.tistory.com/43?category=884219](https://memohg.tistory.com/43?category=884219))
    1. 배열을 어떻게 자를지. 
        - 새로운 배열 = 배열시작점 ... 배열 마지막점
4. 체육복 ([https://memohg.tistory.com/45](https://memohg.tistory.com/45))
    1. 문제의 요구사항을 잘 파악하기.
    2. 최종 인원수 계산 = 원래 인원수 - 잃어버린 친구들 + 빌린 숫자.

        ```swift
        var losted = lost.filter{!reserve.contains($0)}
        var reserved = reserve.filter{!lost.contains($0)}
        ```

5. 2016년([https://memohg.tistory.com/46](https://memohg.tistory.com/46))
    1. 기준점을 잘 구해야 하는 문제였다. 1월 1일은 금요일. 날짜에 0은 없으므로 기준선은 1이되고 배열을 시작할때 인덱스 1의 자리에 금요일을 넣으면 계산이 편해진다.
    2. 모든 달의 날을 계산해서 배열로 만든다.
    3. 리듀스를 통해 몇월이면 해당 달 -1까지의 토탈 일수를 구하고 몇일 이라면 + 몇일 을하고 일주일은 7이니까 %7 을 하면 값이 나오게 된다.
6. String(Array(asdf)[(asdf.count/2)-1...(asdf.count/2)]) 인상깊었던 코드한줄
7. 나누어 떨어지는 숫자 배열 ([https://memohg.tistory.com/51](https://memohg.tistory.com/51))
    - let check = arr.filter { ($0)%divisor == 0 }   // 고차함수 항상 신경쓰자.
8. 문자열 내 마음대로 정렬하기([https://memohg.tistory.com/53](https://memohg.tistory.com/53))
    1. 문자열의 위치를 조회하기 Array(string[?]) // 문자열을 조회할수있다.
    2. sorted( by: <(default), > (내림차순) ) 으로 정렬할수 있다. 안에 클로저 식으로 함수도 작성가능 

        ```swift
        let sorting = strings.sorted(by: { (string1: String, string2: String) -> Bool in 
            if string1[index] == string2[index] {
                return string1 < string2
            } else { return string1[index] < string2[index] }
        ```
