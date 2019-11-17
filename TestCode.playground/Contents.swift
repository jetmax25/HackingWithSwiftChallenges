//: Playground - noun: a place where people can play


////var str = "Hello, playground"
////
////var tutple = ( a : "a value", b: "b balue", c : "c calue")
////
////switch tutple {
////case ( "a value", let lastValue, _ ):
////    print(lastValue)
////case ( _, _, _ ):
////    print("no")
////}
//
////let nums = [1,2,3,4,5,6, nil,7,8, nil, nil]
////
////for case let num? in nums where num > 5{
////    print(num)
////}
//
//enum Age {
//    case young,  mid, old
//
//    var range : Range<Int> {
//        switch self {
//        case .young: return 0..<18
//        case .mid : return 18..<70
//        case .old : return 70..<100
//        }
//    }
//}
//
//
//enum Closures {
//    case test(Int), a(Int)
//}
//
////let test2 = Closures.test(4)
////print(test2)
//
//
//extension String {
//    var isAllCharsUnique: Bool {
//        return self.count == Set(self).count
//    }
//
//    var isPalindrome: Bool {
//        guard self.count > 1 else { return true }
//        return self.lowercased() == String(self.lowercased().reversed())
//    }
//
//    func doesContainSameCharacters(as string: String?) -> Bool {
//        let s1 = self.lowercased()
//        guard let s2 = string?.lowercased(), s1.count == s2.count else { return false }
//
//        return s1.sorted() == s2.sorted()
//    }
//
//    func isSubstring(of string: String?) -> Bool {
//        guard let s2 = string, s2.count >= self.count else { return false }
//        return s2.range(of: self, options: [.caseInsensitive]) != nil
//    }
//}
//
//extension Collection where Element: Hashable {
//    var elementCount: [Element: Int] {
//        let mappedItems = self.map { ($0, 1) }
//        return Dictionary(mappedItems, uniquingKeysWith: +)
//    }
//}
//
//
//extension String {
//
//    var removingDups: String {
//        if let char = self.first {
//            let sChar = String(char)
//            return sChar + self.replacingOccurrences(of: sChar, with: "").removingDups
//        }
//        return ""
//    }
//
//    var condensingWhitespace: String {
//        let prefix = (self.first ?? "_").isWhitespace ? " " : ""
//        let postfix = (self.first ?? "_").isWhitespace ? " " : ""
//
//        return prefix + self.split(separator: " ").joined(separator: " ") + postfix
//    }
//
//    func isRotation(of s2: String?) -> Bool {
//        guard let s2 = s2, self.count == s2.count else { return false }
//        if s2.count == 1 {
//            return self == s2
//        }
//
//        let combo = s2 + s2
//        return combo.contains(self)
//    }
//
//    var isPangram: Bool {
//        guard self.count >= 26 else { return false }
//        return Set(self.lowercased().filter { $0.isLetter }).count == 26
//    }
//
//    var vowelCount: Int {
//        return self.filter { $0.isType(of: .vowel) }.count
//    }
//
//    func differs( from s2: String?, within limit: Int) -> Bool {
//        guard let s2 = s2, s2.count == self.count else { return false }
//        return self.indices.filter { self[$0] != s2[$0] }.count <= limit
//    }
//
//    var commonPrefix: String {
//        return self.split(separator: " ").commonPrefix
//    }
//}
//
//public extension Character {
//
//    enum LetterType {
//        case vowel
//        case consonant
//
//        var letters: String {
//            if self == .vowel {
//                return "aeiou"
//            }
//
//            return "bcdfghjklmnpqrstvwxyz"
//        }
//
//        static func Of(char: Character) -> LetterType {
//            return self.vowel.letters.contains(char.lowercased()) ? .vowel : .consonant
//        }
//    }
//
//    func isType(of letterType: LetterType) -> Bool {
//        return self.isLetter && (Character.LetterType.Of(char: self) == letterType)
//    }
//}
//
//public extension Collection where Element == Substring {
//    var commonPrefix: String {
//        guard let shortest = self.shortestWord else { return "" }
//        var word = ""
//        let stringsAsArray = self.map { Array($0)}
//        for (index, char) in shortest.enumerated() {
//            if stringsAsArray.allSatisfy({ $0[index] == char }) {
//                word += String(char)
//            } else {
//                return word
//            }
//        }
//        return word
//    }
//
//    var shortestWord: Substring? {
//        return self.sorted { $0.count < $1.count }.first
//    }
//}
//
//public extension Array where Element: Equatable {
//    var runLengthEncoding: [(Element, Int)] {
//
//        var result = [(Element, Int)]()
//        var iterator = self.makeIterator()
//        guard var element = iterator.next() else { return result }
//
//        var count = 1
//
//        while let newElement = iterator.next() {
//            if newElement == element {
//                count += 1
//            } else {
//                result.append((element, count))
//                count = 1
//                element = newElement
//            }
//        }
//        //last item
//        result.append((element,count))
//        return result
//    }
//}
//
//public extension String {
//    var runLenghtEncoding: [(Character, Int)] {
//        return Array(self).runLengthEncoding
//    }
//}
//
//public extension Array where Element: Comparable {
//    var perm: [[Element]] {
//        guard self.count > 1 else { return [self] }
//
//        if self.count == 2, let first = self.first, let last = self.last {
//            return [[first, last], [last, first]]
//        }
//
//        var sets = [[Element]]()
//        for element in self {
//            let remain = self.filter { $0 != element }
//            sets += remain.perm.map { $0 + [element]}
//        }
//        return sets
//    }
//}
//
//public extension Array where Element: Hashable {
//    var combo: [[Element]] {
//
//        guard self.count > 0 else { return [[Element]]()}
//
//        var sets = [[Element]]()
//        //sets += [self]
//
//        if let element = self.first {
//            let remain = self.filter { $0 != element }
//            sets += [[element]]
//            let combo = remain.combo
//            sets += combo.map { [element] + $0} + combo
//        }
////        for element in self {
////            let remain = self.filter { $0 != element }
////            sets += remain.combo
////            //sets += remain.combo.map { [element] + $0}
////        }
//        return sets
//    }
//
////    func comboIndexes(of size: Int) -> [[Int]] {
////        let sets = [[Int]]()
////        let count = self.count
////
////        guard size <= count else { return }
////
////        guard size != count else {
////            return
////        }
////
////        return sets
////    }
//}
//
//public extension String {
//    var perm: [String] {
//        return Array(self).perm.map { String($0)}
//    }
//
//    var combo: [String] {
//         return Array(self).combo.map { String($0)}
//    }
//
//    var reverseWords: String {
//        let words = self.split(separator: " ")
//        return words.map { String($0.reversed()) }.joined(separator: " ")
//    }
//}


//
////print([1,2,3,4].perm)
//"Swift Coding Challenges".reverseWords
//
//print("qwertyuiopasd".combo.count)
//
//let testArray = Array(1...1000)



//let start = CFAbsoluteTimeGetCurrent()
//
//var pairs = [(Int,Int)]()
//
//testArray.forEach { p1 in
//    testArray.forEach {
//        _ = (p1, $0)
//       // pairs.append((p1, $0))
//    }
//}
//print(pairs.count)
//let diff = CFAbsoluteTimeGetCurrent() - start
//print(diff)
//
//
//let start2 = CFAbsoluteTimeGetCurrent()
//
//var pairs2 = [(Int,Int)]()
//
//for index in 0..<(testArray.count-1) {
//    for index2 in (index + 1)..<testArray.count {
//        _ = ( testArray[index], testArray[index2])
//       // let index1 = testArray[index]
//      //  let index2 = testArray[index2]
//      //  pairs2.append((index1, index2))
//    }
//}
//print(pairs2.count)
//let diff2 = CFAbsoluteTimeGetCurrent() - start2
//print(diff)
//
//
//
//extension Int {
//    func combos(of size: Int, offset: Int = 0) -> Set<Set<Int>> {
//        var sets = Set<Set<Int>>()
//
//        guard offset + size <= self else {
//            return sets
//        }
//
//        let indeces = Array(offset..<self)
//        if size + offset == self {
//            return [Set(indeces)]
//        }
//
//
//        if size == 1 {
//            return Set(indeces.map { [$0] })
//        }
//
//        if size > 1 {
//            for idx in offset..<self {
//
//                let innerCombos = self.combos(of: size - 1, offset: idx + 1)
//                sets = sets.union( innerCombos.map { Set([idx]).union($0) } )
//            }
//        }
//        return sets
//    }
//}
//
//extension Array where Element: Hashable {
//    func mapCombos(of size: Int) -> [[Element]] {
//        let combos = self.count.combos(of: size)
//        return combos.map { sets in
//            sets.map{
//                self[$0]
//            }
//        }
//    }
//}
//
//print(["one", "two", "three", "four"].mapCombos(of: 2))
//
//
//public extension Int {
//    var fizzBuzz: String? {
//        switch ( self % 3 == 0, self % 5 == 0) {
//        case (true, true): return "Fizz Buzz"
//        case (true, false): return "Fizz"
//        case (false, true): return "Buzz"
//        default: return nil
//        }
//    }
//}
//
//print(15.fizzBuzz ?? "")
//
//print( Int.random(in: 0...4))
//
//
//infix operator ^^
//func ^^(base: Int, power: Int) -> Int {
//    var value = 1
//
//    guard power > 0 else { return value }
//    for _ in 1...power {
//        value *= base
//    }
//    return value
//}
//
//var a = 5
//var b = 10
//
//(a,b) = (b,a)

public extension Int {
    func asBinaryString() -> String {
        return String(self, radix: 2)
    }
    
    ///get the binary representation of an int, using padded zeros for 8 bit representation
    func asPaddedBinaryString() -> String {
        let binaryString = self.asBinaryString()
        let count = binaryString.count
        let zeros = (8 - (count % 8)) % 8
        return String.init(repeating: "0", count: zeros) + binaryString
    }

    var numberOfOnesInBinary: Int {
        return self.asBinaryString().filter{ $0 == "1" }.count
    }

    var isEven: Bool {
        return self % 2 == 0
    }

    ///Get the next highest and lowest int containing thename number of binary ones as the original value
    var nextHighestAndLowesetWithSameNumberOfOnes: (high: Int?, low: Int?) {
        guard self != 0 else { return (high: nil, low: nil) }

        let binaryString = self.asBinaryString()

        //if the binary string is all 1s then the next higheset is one more digit removing the largest one
        // the lowest does not exist
        guard binaryString.contains("0") else {
            let highBinary = "10" + binaryString.dropFirst()
            let highValue = Int(highBinary, radix: 2)
            return (high: highValue, low: nil)
        }
        
        var minhighArray = Array(binaryString)
        guard let minLastZero = minhighArray.lastIndex(of: "0") else { fatalError() }
        guard let minlastOne = minhighArray[0...minLastZero].lastIndex(of: "1") else {
            fatalError()
        }
        
        minhighArray[minlastOne] = "0"
        minhighArray[minLastZero] = "1"
        let lowNumber = String(minhighArray)
        
        var highArray = Array(binaryString)
        guard let lastOne = highArray.lastIndex(of: "1") else { fatalError() }
        guard let lastZero = highArray[0...lastOne].lastIndex(of: "0") else {
            return (high: Int(String("10" + highArray.dropFirst()), radix: 2), low:  Int(lowNumber, radix: 2))
        }
        highArray[lastOne] = "0"
        highArray[lastZero] = "1"
        return (high: Int(String(highArray), radix: 2), low:  Int(lowNumber, radix: 2))
    }
    
    ///reverse a padding binary string and return the int value
    var reversedBinaryInt: Int {
        return Int(String(self.asPaddedBinaryString().reversed()), radix: 2)!
    }
}

let testValue = 256
print(testValue.asBinaryString())
print(testValue.asPaddedBinaryString())
print(testValue.reversedBinaryInt)
