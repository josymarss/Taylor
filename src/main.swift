import Foundation 

var text = "var points = 10"
var lexer = Lexer(sourceCode: text)

while let token = lexer.nextToken() {
    print(token)
}
