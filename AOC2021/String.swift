//
//  String.swift
//  AOC2021
//
//  Created by Vincent Frascello on 12/2/21.
//

//  Thanks Jon :)
extension String {
    func removeEmptySpace() -> String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func separateByNewLine() -> [String] {
        removeEmptySpace().split(separator: "\n").map(String.init)
    }
    
    func separateBySpace() -> [String] {
        removeEmptySpace().split(separator: " ").map(String.init)
    }
    
    func separateByComma() -> [String] {
        removeEmptySpace().split(separator: ",").map(String.init)
    }
    
    subscript (characterIndex: Int) -> Character {
        return self[index(startIndex, offsetBy: characterIndex)]
    }
}
