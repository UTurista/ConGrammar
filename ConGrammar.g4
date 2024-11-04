grammar ConGrammar;

/*
 * Parser Rules
 */  
 
file                : block+ EOF?
                    | EOF
                    ;
 
block               : (NEWLINE | statement (NEWLINE | EOF))+
                    ;  

statement           : declaration
                    | initialization
                    | condition
                    | invoke
                    | invokeAssign
                    | reassignment
                    | run
                    | include
                    | whileloop
                    | RETURN
                    ; 

whileloop           :  WHILE expression NEWLINE block NEWLINE ENDWHILE;

condition           : IF expression block? (elif_clause)* (else_clause)? ENDIF;
elif_clause         : ELSEIF expression NEWLINE block?;
else_clause         : ELSE NEWLINE block?;

expression          : LeftValue=literal LESSOREQUALTHAN RightValue=literal         # LessThanOrEqual
                    | LeftValue=literal LESSTHAN RightValue=literal                # LessThan
                    | LeftValue=literal GREATEROREQUALTHAN RightValue=literal      # GreaterThanOrEqual
                    | LeftValue=literal GREATERTHAN RightValue=literal             # GreaterThan
                    | LeftValue=literal NOTEQUALS RightValue=literal               # NotEquals
                    | LeftValue=literal EQUALS RightValue=literal                  # Equals
                    ;

declaration         : VAR Id=STRING               # VariableDeclaration
                    | CONST Id=STRING             # ConstantDeclaration
                    ;

initialization      : VAR Id=STRING '=' Value=literal     # VariableInitialization
                    | CONST Id=STRING '=' Value=literal   # ConstantInitialization
                    | VAREXEC Id=STRING '=' Value=literal # VariableExecuteInitialization
                    ;

reassignment        : Id=STRING '=' Value=literal;

run                 : RUN Path=literal Arguments=literal*;
include             : INCLUDE Path=literal Arguments=literal*;
invoke              : Command=STRING Arguments=literal*;
invokeAssign        : invoke '->' Id=STRING;
literal             : NUMBER               # Number 
                    | STRING               # String
                    ;



/*
 * Lexer Rules
 */

fragment A : ( 'a' | 'A' );
fragment B : ( 'b' | 'B' );
fragment C : ( 'c' | 'C' );
fragment D : ( 'd' | 'D' );
fragment E : ( 'e' | 'E' );
fragment F : ( 'f' | 'F' );
fragment G : ( 'g' | 'G' );
fragment H : ( 'h' | 'H' );
fragment I : ( 'i' | 'I' );
fragment J : ( 'j' | 'J' );
fragment K : ( 'k' | 'K' );
fragment L : ( 'l' | 'L' );
fragment M : ( 'm' | 'M' );
fragment N : ( 'n' | 'N' );
fragment O : ( 'o' | 'O' );
fragment P : ( 'p' | 'P' );
fragment Q : ( 'q' | 'Q' );
fragment R : ( 'r' | 'R' );
fragment S : ( 's' | 'S' );
fragment T : ( 't' | 'T' );
fragment U : ( 'u' | 'U' );
fragment V : ( 'v' | 'V' );
fragment W : ( 'w' | 'W' );
fragment X : ( 'x' | 'X' );
fragment Y : ( 'y' | 'Y' );
fragment Z : ( 'z' | 'Z' );

REM                 : R E M;
BEGINREM            : B E G I N R E M;
ENDREM              : E N D R E M ;
VAR                 : V A R ;
VAREXEC             : V A R E X E C;
CONST               : C O N S T ;
RUN                 : R U N;
INCLUDE             : I N C L U D E;
RETURN              : R E T U R N;
IF                  : I F;
ELSE                : E L S E;
ELSEIF              : E L S E I F;
ENDIF               : E N D I F;
WHILE               : W H I L E;
ENDWHILE            : E N D W H I L E;
LESSOREQUALTHAN     : L E S S T H A N O R E Q U A L | '<=';
LESSTHAN            : L E S S T H A N | '<';
GREATEROREQUALTHAN  : G R E A T E R T H A N O R E Q U A L| '>=';
GREATERTHAN         : G R E A T E R T H A N | '>';
NOTEQUALS           : N O T E Q U A L S | '!=';
EQUALS              : E Q U A L S | '==';
COMMENT             : REM (~('\n' | '\r'))* NEWLINE? -> channel(HIDDEN); 
MULTICOMMENT        : BEGINREM (.|NEWLINE)*? ENDREM -> channel(HIDDEN);
WHITESPACE          : (' '|'\t')+ -> skip;
NEWLINE             : ('\r'? '\n' | '\r')+;
STRING              : ~( ' ' | '\n' | '\r' | '\t' | '"' )+ |  '"' ~( '\n' | '\r' )* '"';
NUMBER              : [0-9]+('.' [0-9]+)?;