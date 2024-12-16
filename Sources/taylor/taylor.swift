import Foundation 
// The Swift Programming Language
// https://docs.swift.org/swift-book

let inputFile = "x = 10"
let lexer = Lexer(sourceCode: inputFile)
let result = lexer.getNextToken()

// func main () {
  // print("Token: \(result)")
// }
