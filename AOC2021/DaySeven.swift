import Foundation

extension AdventOfCode {
    public func daySeven() {

        let rawInput = try! String(contentsOfFile: "/Users/dereq/Developer/AdventOfCode/AOC2021/Inputs/daySevenInput")

        let crabList = rawInput.separateByComma().map( { Int($0)! })

        var fuelNeeded: [Int] = Array(repeating: 0, count: crabList.max()!)

        for position in 0..<crabList.max()! {
            for crab in 0..<crabList.count {
                let spaces = abs(crabList[crab]-position)
                fuelNeeded[position]+=fuel(spaces)
            }
        }

        print(fuelNeeded.reduce(Int.max, min))
    }

    public func fuel(_ spaces: Int) -> Int {
        return spaces + ((spaces == 0) ? 0 : fuel(spaces-1))
    }
}
