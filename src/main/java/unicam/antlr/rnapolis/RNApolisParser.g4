/*
 * ANTLR 4 PARSER grammar for RNApolis output
 *
 * @author Francesco Palozzi
 */
parser grammar RNApolisParser;

options {
    tokenVocab = RNApolisLexer;
}

@header {
   package unicam.parser.rnapolis;
}

// Parser rules
rnapolisFile: strandSection+ EOF;

strandSection: header sequenceLine interactionLine*;

header: HEADER_START strandName NEWLINE;

strandName: H_ID;

sequenceLine: SEQ_START WS nucleotideSequence NEWLINE;

nucleotideSequence: S_NUCLEOTIDE+;

interactionLine: INTERACTION_TYPE WS interactionPattern NEWLINE;

interactionPattern: SYMBOL+;