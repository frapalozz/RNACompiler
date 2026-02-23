/*
 * ANTLR 4 grammar for RNAview output
 *
 * @author Francesco Palozzi
 */
parser grammar RNAviewParser;

options {
    tokenVocab = RNAviewLexer;
}

rnaviewFile:
    FILE_NAME pairs+ EOF
;

pairs:
    base_numbers chain_id residue base_pair residue chain_id base_pair_annotation saenger?
;

base_numbers: NUMBER NUMBER;

chain_id: CHAIN;

residue: NUMBER;

base_pair: BASE_PAIR;

base_pair_annotation: BASE_PAIR_ANNOTATION;

saenger: SAENGER;