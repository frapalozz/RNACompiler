/*
 * ANTLR 4 PARSER grammar for RNApolis output
 *
 * @author Francesco Palozzi
 */
parser grammar RNApolisParser;

options {
    tokenVocab = RNApolisLexer;
}

rnapolisFile:
    strandSection+ EOF
;

strandSection:
    strandName sequenceLine interactionLine*
;

strandName:
    TITLE
;

sequenceLine:
    NUCLEOTIDE
;

interactionLine:
    INTERACTION_TYPE interactionPattern
;

interactionPattern:
    SYMBOL+
;