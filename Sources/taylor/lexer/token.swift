import Foundation

enum TokenType {
  case Identifier
  case Nov // No Value == nil
  case True 
  case False 
  case Number 
  case Str
  
  // Braces
  case OpenBracket 
  case CloseBracket
  case LeftParen
  case RightParen
  case LeftBrace
  case RightBrace

  // Equivalence
  case Assign
  case Equality
  case Inequality

  //Conditional
  case Less
  case Greater
  case LessThanOrEqual
  case GreaterThanOrEqual

  //Logical 
  case Or
  case And

  // Symbols
  case Dot
  case DotDot
  case Colon
  case ColonColon
  case Question
  case QuestionQuestion
  case Comma

  // Shorthand
  case PlusEqual
  case MinusEqual
  case MultiplyEqual
  case DivideEqual

  //Math
  case Plus
  case Minus
  case Divide
  case Multiply
  case Percent

  // Keywortd
  case Space // let or var 
  case Imut // const or let in swift
  case Struct 
  case Pack // use or import 
  case Of // from import 
  case Fun
  case If 
  case Else 
  case RepeatLoop // Only one Loop can be combined  
  case In 
  case Return 
  case Break 
  case Continue 
  case Typekeyword 
  case Enum 
  case Impl
  case Error
  case EOF
}

struct Token {
  var kind: TokenType
  var value: String
}


