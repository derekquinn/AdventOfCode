//
//  dayFive.swift
//  AOC2021
//
//  Created by Vincent Frascello on 12/4/21.
//

import Foundation

extension AdventOfCode {
    
    public func dayFive() {
        let rawInput = try! String(contentsOfFile: "/Users/dereq/Developer/AdventOfCode/AOC2021/Inputs/dayFiveInput.txt")
        //partOne
        let lineInput = rawInput
            .replacingOccurrences(of: "->", with: "")
            .replacingOccurrences(of: ",", with: " ")
            .separateByNewLine()
        
        var ventMap = Array(repeating: Array(repeating: 0, count: 1000), count: 1000)
        
        for line in lineInput {
            var vent = line.separateBySpace().map({ Int($0)! })
            //26-53 part two only
            if vent[2]-vent[0] > 0 && vent[3] - vent[1] > 0 {
                //positive slope in increasing order
                for i in vent[0]...vent[2] {
                    ventMap[i][vent[1]+(i-vent[0])]+=1
                }
                continue
            }
            else if vent[2]-vent[0] > 0 && vent[3] - vent[1] < 0 {
                //negative slope in increasing (x) order, subtract increment
                for i in vent[0]...vent[2] {
                    ventMap[i][vent[1]-(i-vent[0])]+=1
                }
                continue
            }
            else if vent[2]-vent[0] < 0 && vent[3] - vent[1] > 0 {
                //negative slope in decreasing (x) order, subtract increment and swap x.
                for i in vent[2]...vent[0] {
                    ventMap[i][vent[3]-(i-vent[2])]+=1
                }
                continue
            }
            else if vent[2]-vent[0] < 0 && vent[3] - vent[1] < 0 {
                //positive slope in decreasing order, swap everything
                for i in vent[2]...vent[0] {
                    ventMap[i][vent[3]+(i-vent[2])]+=1
                }
                continue
            }
            //order is agnostic on horizontal, vertical, so reorder points for easy counting.
            if vent[0] > vent[2] {
                vent.swapAt(0, 2)
            }
            if vent[1] > vent[3] {
                vent.swapAt(1, 3)
            }
            if vent[0] == vent[2] {
                //vertical
                for i in vent[1]...vent[3] {
                    ventMap[vent[0]][i]+=1
                }
                continue
            }
            if vent[1] == vent[3] {
                //horizontal
                for i in vent[0]...vent[2] {
                    ventMap[i][vent[1]]+=1
                }
                continue
            }
        }
        var totalCount = 0
        for vent in ventMap {
            for i in vent {
                if i >= 2 {
                    totalCount += 1
                }
            }
        }
        print(totalCount)
    }
}

