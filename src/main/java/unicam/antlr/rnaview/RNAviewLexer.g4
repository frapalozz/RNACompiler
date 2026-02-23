/*
 * ANTLR 4 LEXER grammar for RNAview output
 *
 * @author Francesco Palozzi
 */
lexer grammar RNAviewLexer;

// ------------------------------------------------
// Fragments
// ------------------------------------------------
fragment WS_CHAR: [ \t];
fragment NEWLINE_CHAR: '\r'? '\n';
fragment IUPAC_CODE: [ACGUacguTtRrYysSWwKkMmBbDdHhVvNn-];
fragment NON_STANDARD_CODE: ["?]~[-+=/47P0I];

// ----------------------------------------------------------------
// Default mode - for everything except specialized modes
// ----------------------------------------------------------------
WS: WS_CHAR+ -> skip;
NEWLINE: NEWLINE_CHAR -> skip;

// Switch to FILE_NAME mode when see 'PDB data file name: '
FILE: 'PDB data file name: ' -> skip, pushMode(FILE_NAME_MODE);

BEGIN_PAIR: '-'+.*'BEGIN_base-pair'NEWLINE_CHAR -> skip, pushMode(PAIRS_MODE);


// ------------------------------------------------
// File name mode - after 'PDB data file name: '
// ------------------------------------------------
mode FILE_NAME_MODE;

F_NEWLINE: NEWLINE_CHAR -> skip;

FILE_NAME
    : ( '/'? [a-zA-Z0-9_-]+ '/' )*
      [a-zA-Z0-9_]+
      '.' ~[ /?#\n]+
    -> popMode;

// ------------------------------------------------
// Pairs mode - after 'BEGIN_base-pair'
// ------------------------------------------------
mode PAIRS_MODE;

CHARS_TO_SKIP: [_,: ] -> skip;

CHAIN: [A-Z];

NUMBER: [1-9]+[0-9]*;

BASE_PAIR: [A-Z]'-'[A-Z];

BASE_PAIR_ANNOTATION: [SWH+-]'/'[SWH+-](' cis'|' tran') | 'stacked';

SAENGER: [XI]+ | 'n/a' | '!('[bs]'_s)';

END_PAIR: 'END_base-pair' -> skip, popMode, pushMode(EXTRA_MODE);

// ------------------------------------------------
// Extra mode - after 'END_base-pair'
// ------------------------------------------------
mode EXTRA_MODE;

OTHERS: .* -> skip;