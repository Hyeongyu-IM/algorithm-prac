# algorithm-prac

## 알고리즘 문제 리뷰. 프로그래머스 레벨 1 (2020.10.25 )

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
