//
//  RomanNumeralsModel.swift
//  RomanNumerals
//
//  Created by andrew challis on 09/12/2018.
//  Copyright © 2018 andrew challis. All rights reserved.
//

import Foundation


extension Dictionary where Value: Equatable {
    func key(forValue value: Value) -> Key? {
        return first { $0.1 == value }?.0
    }
}

class RomanNumerals {
    
    static var map = [1000000: "M\u{305}", 900000: "C\u{305}M\u{305}", 500000: "D\u{305}", 400000: "C\u{305}D\u{305}",
                      100000: "C\u{305}", 90000: "X\u{305}C\u{305}", 50000: "L\u{305}", 40000: "X\u{305}L\u{305}",
                      10000: "X\u{305}", 9000: "MX\u{305}", 5000: "V\u{305}", 4000: "MV\u{305}",
                      1000: "M", 900: "CM", 500: "D", 400: "CD", 100: "C", 90: "XC",
                      50: "L", 40: "XL", 10: "X", 9: "IX", 5: "V", 4: "IV", 1: "I"]
    
    class func toRoman(n: Int) -> String {
        if n <= 0 {return ""} else if n >= map.keys.max()!*4 {return "Value is too large!"}
        var output = map[map.keys.filter{$0 <= n}.max()!]!
        var k = map.keys.filter{$0 <= n}.max()!
        while k != n {
            output += map[map.keys.filter{$0 <= n-k}.max()!]!
            k += map.keys.filter{$0 <= n-k}.max()!
        }
        return(output)
    }
    
    class func fromRoman(s: String) -> String {
        if s == "" {return ""}
        var lastChar = 0; var output = 0
        
        for char in Array(s.uppercased().reversed()) {
            if let currentCharValue = map.key(forValue:String(char)) {
                output += currentCharValue >= lastChar ? currentCharValue : -currentCharValue
                lastChar = currentCharValue
            } else {
                return("\(char) is an invalid roman numeral")
            }
            
        }
        
        if output >= map.keys.max()!*4 {return "Value is too large!"}
        return(String(output))
    }
    
}
