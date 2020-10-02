//
//  main.swift
//  algorithm prac
//
//  Created by 임현규 on 2020/09/30.
//
import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let problem = readLine()!
    let pArr = problem.components(separatedBy: " ")
    let x = Int(pArr[0])!
    let y = Int(pArr[1])!
    print(x + y)
}

//let a = Int(readLine()!)!
//for _ in 1...a{
//    let d = readLine()!.split{$0 == " "}.map{Int($0)!}.reduce(0,+)
//    print(d)
//}


//정수하나를 입력받아서 1부터 9까지
//let num = Int(readLine()!)!
//for i in 1...9 {
//   print("\(num) * \(i) = \(num * i)")
//}


//지정한 시간보다 45분 빠르게 표현
//만약 10시 10분이라면 -> 9시 25분
// 두번째 정수가 45보다 작으면 첫번째 에서 -1 하고
// 두번째 정수에 60을 더하고 45분을 빼면 된다.
// 시간이 0시일때 분이 45보다 작으면 23으로 설정

//let line = readLine()!.components(separatedBy: " ")
//let H = Int(line[0])!
//let M = Int(line[1])!
//
//if H == 0 && M < 45 {
//    print("23 \(M+60 - 45)")
//} else if M >= 45 {
//    print("\(H) \(M-45)")
//} else {
//    print("\(H-1) \(M+60 - 45)")
//}

// 1, 2, 3, 4 분면 조건
// 1 = +x, +y
// 2 = -x, +y
// 3 = -x, -y
// 4 = x+ , -y
//let x = Int(readLine()!)!
//let y = Int(readLine()!)!
//if x > 0 && y > 0 {
//    print(1)
//} else if x < 0 && y > 0 {
//    print(2)
//} else if x < 0 && y < 0 {
//    print(3)
//} else {
//    print(4)
//}

// 윤년인 조건 -- 조건문을 작성하는 순서도 중요하다.
// 100 % == 400으로 나뉘어지면 100퍼센트 윤달
//let num = Int(readLine()!)!
//
//if num % 400 == 0 {
//    print(1)
//} else if num % 100 == 0{
//    print(0)
//} else if num % 4 == 0 {
//    print(1)
//} else {
//    print(0)
//}
// 윤년인 조건 -- 조건문을 작성하는 순서도 중요하다.
// 100 % == 400으로 나뉘어지면 100퍼센트 윤달

// 등급 판별
//let num = Int(readLine()!)!
//
//if (100 >= num) && (num >= 90) {
//    print("A")
//} else if (89 >= num) && (num >= 80) {
//    print("B")
//} else if (79 >= num) && (num >= 70) {
//    print("C")
//} else if (69 >= num) && (num >= 60) {
//    print("D")
//} else {
//    print("F")
//}

// A B 누가 더큰지 판별
//let line = readLine()!.components(separatedBy: " ")
//let a = Int(line[0])!
//let b = Int(line[1])!
//
//if a > b {
//    print(">")
//} else if a < b {
//    print("<")
//} else {
//    print("==")
//}

//let line = readLine()!.components(separatedBy: " ")
//let a = Int(line[0])!
//let b = Int(line[1])!
//
//print(a+b)

//let A = Int(readLine()!)!
//let B = Int(readLine()!)!
//print("\(A*(B%10))\n\(A*((B/10)%10))\n\(A*(B/100))\n\(A*B)")
