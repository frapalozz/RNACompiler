/*
 * ANTLR 4 LEXER grammar for RNApolis output
 * Uses lexical modes to separate contexts
 *
 * @author Francesco Palozzi
 */
lexer grammar RNApolisLexer;

// Default mode - for everything except headers and sequences
INTERACTION_TYPE: [ct] ('WW'|'WH'|'HW'|'HH'|'WS'|'SW'|'HS'|'SH'|'SS');

SYMBOL: '.'
      | '(' | ')'
      | '[' | ']'
      | '{' | '}'
      | '<' | '>'
      | [A-Z]
      | [a-z];

WS: [ \t]+ -> skip;
NEWLINE: '\r'? '\n' -> skip;
COMMENT: '#' ~[\r\n]* -> skip;

// Switch to HEADER mode when we see '>'
HEADER_START: '>' -> pushMode(HEADER_MODE);

// Switch to SEQUENCE mode when we see 'seq'
SEQ_START: 'seq' -> pushMode(SEQ_MODE);

// Header mode - after '>'
mode HEADER_MODE;

H_ID: [a-zA-Z_] [a-zA-Z0-9_]*;
H_WS: [ \t]+ -> skip;
H_NEWLINE: '\r'? '\n' -> popMode;

// Sequence mode - after 'seq'
mode SEQ_MODE;

S_WS: [ \t]+ -> skip;
S_NUCLEOTIDE: [ACGUacgu]+;
S_NEWLINE: '\r'? '\n' -> popMode;