//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        let finalOp = args[args.count - 1]
        if finalOp == "count" {
            return args.count - 1
        } else if finalOp == "fact" {
            if args.count == 1 {
                return 0
            } else {
                var res = 1
                for i in 1...Int(args[0])! {
                    res *= i
                }
                return res
            }
        } else if finalOp == "avg" {
            if args.count == 1 {
                return 0
            } else {
                var res = 0
                for i in 0...args.count - 2 {
                    res += Int(args[i])!
                }
                return res / (args.count - 1)
            }
        } else {
            let num1 = Int(args[0])
            let num2 = Int(args[2])
            switch args[1] {
                case "+": return num1! + num2!
                case "-": return num1! - num2!
                case "*": return num1! * num2!
                case "/": return num1! / num2!
                case "%": return num1! % num2!
                default: return 0
            }
        }
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

