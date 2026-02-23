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
UNCOMMON_RESIDUE: 'uncommon residue' [a-zA-Z0-9#:[\] ]* -> skip;

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

CHARS_TO_SKIP: [_,: \n] -> skip;

CHAIN: [A-Z];

NUMBER: [1-9]+[0-9]*;

BASE_PAIR: [a-zA-Z]'-'[a-zA-Z];

BASE_PAIR_ANNOTATION: [sSWH+-.]'/'[sSWH+-.](' cis'|' tran') | 'stacked';

SAENGER: [XVI]+ | 'n/a' | '!' ('1H')? '('[bs]'_'[bs]')';

END_PAIR: 'END_base-pair' -> skip, popMode, pushMode(EXTRA_MODE);

// ------------------------------------------------
// Extra mode - after 'END_base-pair'
// ------------------------------------------------
mode EXTRA_MODE;

OTHERS: .* -> skip;