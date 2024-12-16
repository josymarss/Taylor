import Foundation 

public class Lexer {
  var current: String?
  var pos = 0 

  init(sourceCode: String) {
    self.current = !sourceCode.isEmpty ? String(sourceCode[sourceCode.startIndex]) : ""
  }

  func skipWhiteSpace() {
    if let strToken = self.current {
      while strToken == " " {
        self.pos += 1
        // let isWhitespace = strToken.allSatisfy { $0.isWhiteSpace } 

        }
      }
    }    

  func advance() {
    guard let token = self.current else { return } 
    
    if pos < token.count {
      pos += 1
    } else {
      // current = ""
    }
  }

  func isNumber(of value: String) -> Bool {
    return value.allSatisfy{ $0.isNumber }
  }

  func isLetter (of value: String) -> Bool {
    return value.allSatisfy{ $0.isLetter }
  }
  func toInteger () -> Int {
    let result = ""
    // if let tokenVar = self.current {
      // let result = tokenVar.range(of:"^[0-9]+$", options:.regularExpression)
    //   while  {
    //   result += tokenVar
    //   advance()
    // }
    // }
    
    return Int(result, radix: 16) ?? 0
  }

  func isIdentifier() -> Bool {
    if let token = self.current {
      return token.range(of: "^[0-9]+$", options: .regularExpression) != nil || token == "_" 
    }
    return false
  }

  func toIdentifier() -> String {
    var result = ""
    
    if let token = self.current  {
      while token.range(of:"^[a-zA-Z]+$", options: .regularExpression) != nil || token == "_" {
        result += token
        advance()
      }
    }

    return result    
    
  }
  func getNextToken() -> Token {    
    guard let token = self.current else {
      return Token(kind: .Error, value: "Unknow token")
    }

    while self.current != nil {
      advance() //  should i do that ?
      
      // if token.isWhitespace {
      //   skipWhiteSpace()
      //   continue
      // }

      if isIdentifier() {
        let idFounded = toIdentifier() // return a complete identifier
        return Token(kind: .Identifier, value: idFounded)
      }

      if self.isNumber(of: token){
        let numberFounded = toInteger() // return a complete number
        return Token (kind: .Number, value: String(numberFounded))
      }
      
      if self.current == "+=" {
          return Token(kind: .PlusEqual, value: token)
      }

      if self.current == "-=" {
        return Token(kind: .MinusEqual, value: token)
      }

      if self.current == "*=" {
        return Token(kind: .PlusEqual, value: token)
      }

      if self.current == "/=" {
        return Token(kind: .DivideEqual, value: token)
      }

      if self.current == "+" {
        return Token (kind: .Plus, value: token) 
      }

      if self.current == "-" {
        return Token (kind: .Minus, value: token) 
      }

      if self.current == "*" {
        return Token (kind: .Multiply, value: token) 
      }

      if self.current == "/" {
        return Token (kind: .Divide, value: token) 
      }

      if self.current == "(" {
        return Token (kind: .LeftParen, value: token) 
      }

      if self.current == ")" {
        return Token (kind: .RightParen, value: token) 
      }

      if self.current == "{" {
        return Token (kind: .OpenBracket, value: token) 
      }

      if self.current == "}" {
        return Token (kind: .CloseBracket, value: token) 
      }

      if self.current == "[" {
        return Token (kind: .LeftBrace, value: token) 
      }
      if self.current == "]" {
        return Token (kind: .RightBrace, value: token) 
      }
      
      if self.current == "==" {
        return Token (kind: .Equality, value: token) 
      }
       if self.current == "!=" {
        return Token (kind: .Inequality, value: token) 
      }
      if self.current == "=" {
        return Token (kind: .Assign, value: token) 
      }
      if self.current == "<=" {
        return Token (kind: .LessThanOrEqual, value: token)
      }

      if self.current == ">=" {
        return Token (kind: .GreaterThanOrEqual, value: token)
      }
      if self.current == ">" {
        return Token (kind: .Greater, value: token) 
      }

      if self.current == "<" {
        return Token (kind: .Less, value: token)
      }

      if self.current == "||" {
        return Token (kind: .Or, value: token)
      }

      if self.current == "&&" {
        return Token(kind: .And, value: token)
      }

      if self.current == ".." {
        return Token(kind: .DotDot, value: token)
      }
      if self.current == "." {
        return Token(kind: .Dot, value: token)

      }
      if self.current == "::" {
        return Token(kind: .ColonColon, value: token)
      }
      if self.current == "??" {
        return Token(kind: .QuestionQuestion, value: token)
      }
      if self.current == "?" {
        return Token(kind:.Question, value: token)
      }
      if self.current == "," {
        return Token(kind:.Comma, value: token)
      }

      // error 
      if token.count > 0 {
        return Token(kind: .Error, value: token)
      }   
    }
    return Token(kind: .EOF, value: "")
  }

  // func tokenize(token: Token) -> Token {
  // switch token {
  //   case .Identifier:
  //     return Token (
  //       value: token.value,
  //       kind: token.kind
  //     )
  // }
  // }
}
