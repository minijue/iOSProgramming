//
//  main.swift
//  swiftTest
//  测试简单值和程序流程
//  Created by 王珏 on 2017/3/21.
//  Copyright © 2017年 wangjue. All rights reserved.
//

var optionalString: String?="Hello"
print(optionalString==nil)

var optionalName: String? = nil
var greeting = "Hello, \(optionalName ?? "Wangjue")"

print(greeting)

let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber","watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup")
}

var score = 100
switch score {
case 0..<60:
    print("不及格")
case 60..<70:
    print("及格")
case 70..<80:
    print("中等")
case 80..<90:
    print("良好")
case 90...100:
    print("优秀")
default:
    print("作弊")
}

let point=(3,0)
switch point {
case (_, 0):
    print("位于 x 轴")
case (0, _):
    print("位于 y 轴")
case (1...10, 1...10):
    print("位于第一象限")
case (1...10, -10..<0):
    print("位于第二象限")
case (-10..<0,-10..<0):
    print("位于第三象限")
case (-10..<0,1...10):
    print("位于第四象限")
default: break
    
}
