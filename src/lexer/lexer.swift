import Foundation 

public class Lexer {
  var current: String?
  var pos = 0 

  init(sourceCode: String) {
    self.current = !sourceCode.isEmpty ? sourceCode[sourceCode.startIndex] : nil
  }

  func advance() {
    if pos < self.current.count {
      pos += 1
    } else {
      current = ""
    }
  }

  func skipWhiteSpace() {
    while current.hasPrefix(" ") || current.hasPrefix("\t") || current.hasPrefix("\n") {
      advance()
    }
  }

  func toInteger () -> Int {
    var result = ""

    while self.current != nil && self.current?.isHexDigit {
      reslut += self.current 
      advance()
    }
    return Int(result, radix: 16) ?? 0
  }

  func isIdentifier() -> Bool {
    return self.current?.isLetter || self.current == "_" 
  }

  func toIdentifier() -> String {
    var result = ""

    while self.current != nil && (self.current?.isLetter || self.current == "_") {
      result += self.current
      advance()
    }
    result
  }
  func getNextToken() -> Token {
    skipeWhiteSpace()
    let start = pos

    while self.current != nil {
      advance()
      
      if self.current?.isWhitespace {
        skipWhiteSpace()
        continue
      }

      if isIdentifier() {
        return Token(kind: .Identifier, value: toIdentifier())
      }
      if self.current?.isHexDigit {
        return Token (kind: .Number, value: self.toInteger())
      }
      
      if self.current == "+=" {
          return Token(kind: .PlusEqual, value: self.value)
      }

      if self.current == "-=" {
        return Token(kind: .MinusEqual, value: self.value)
      }

      if self.current == "*=" {
        return Token(kind: .PlusEqual, value: self.value)
      }

      if self.current == "/=" {
        return Token(kind: .DivideEqual, value: self.value)
      }

      if self.current == "+" {
        return Token (kind: .Plus, value: self.value) 
      }

      if self.current == "-" {
        return Token (kind: .Minus, value: self.value) 
      }

      if self.current == "*" {
        return Token (kind: .Multiply, value: self.value) 
      }

      if self.current == "/" {
        return Token (kind: .Divide, value: self.value) 
      }

      if self.current == "(" {
        return Token (kind: .LeftParen, value: self.value) 
      }

      if self.current == ")" {
        return Token (kind: .RightParen, value: self.value) 
      }

      if self.current == "{" {
        return Token (kind: .OpenBracket, value: self.value) 
      }

      if self.current == "}" {
        return Token (kind: .CloseBracket, value: self.value) 
      }

      if self.current == "[" {
        return Token (kind: .LeftBrace, value: self.value) 
      }
      if self.current == "]" {
        return Token (kind: .RightBrace, value: self.value) 
      }
      
      if self.current == "==" {
        return Token (kind: .Equaly, value: self.value) 
      }
       if self.current == "!=" {
        return Token (kind: .Inequaly, value: self.value) 
      }
      if self.current == "=" {
        return Token (kind: .Assign, value: self.value) 
      }
      if self.current == "<=" {
        return Token (kind: .LessThanOrEqual, value: self.value)
      }

      if self.current == ">=" {
        return Token (kind: .GreaterThanOrEqual, value: self.value)
      }
      if self.current == ">" {
        return Token (kind: .Greater, value: self.value) 
      }

      if self.current == "<" {
        return Token (kind: .Less, value: self.value)
      }

      if self.current == "||" {
        return Token (kind: .Or, value: self.value)
      }

      if self.current == "&&" {
        return Token(kind: .And, value: self.value)
      }

      if self.current == ".." {
        return Token(kind: .DotDot, value: self.value)
      }
      if self.current == "." {
        return Token(kind: .Dot, value: self.value)

      }
      if self.current == "::" {
        return Token(kind: .ColonColon, value: self.value)
      }
      if self.current == "??" {
        return Token(kind: .QuestionQuestion, value: self.value)
      }
      if self.current == "?" {
        return Token(kind:.QUestion, value: self.value)
      }
      if self.current == "," {
        return Token(kind:.Comma, value: self.value)
      }

      if self.current == "," {
        return Token(kind:.Comma, value: self.value)
      }    
    }
    return Token(kind:.EOF, value: "")
  }

  func tokenize(token: Token) -> Token {
  switch token {
    case .Identifier:
      return Token (
        value: token.value,
        kind: token.kind
      )
  }
  }
}
