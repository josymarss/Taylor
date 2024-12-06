import Foundation 

var token: String 
var file // input file 
var source = try String(contentsOfFile: file, enconding: .utf8)
var iterator = source.makeIterator()

enum Token {
    case Id,
    case Keyword(KeywordType)
    case Number 
    case OpenBr
    case CloseBr
    case OpenPar
    case ClosePar,
}

enum keywordType {
    case Is, // if
    case IsNot, // else
    case Repeat // Loop 
    case not  // !
    case eq // ==
    case noteq // != 
    case difer // <>
    case assign // assign 
}

func next() {
    token = iterator.next()
}
