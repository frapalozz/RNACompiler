// Generated from C:/Users/paloz.VALENTINA/Desktop/RNACompiler/src/main/java/unicam/antlr/rnaview/RNAviewParser.g4 by ANTLR 4.13.2
package unicam.antlr.rnaview;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast", "CheckReturnValue", "this-escape"})
public class RNAviewParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.13.2", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		START=1;
	public static final int
		RULE_rnaviewFile = 0;
	private static String[] makeRuleNames() {
		return new String[] {
			"rnaviewFile"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, "START"
		};
	}
	private static final String[] _SYMBOLIC_NAMES = makeSymbolicNames();
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}

	@Override
	public String getGrammarFileName() { return "RNAviewParser.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	public RNAviewParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@SuppressWarnings("CheckReturnValue")
	public static class RnaviewFileContext extends ParserRuleContext {
		public TerminalNode START() { return getToken(RNAviewParser.START, 0); }
		public RnaviewFileContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_rnaviewFile; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof RNAviewParserListener ) ((RNAviewParserListener)listener).enterRnaviewFile(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof RNAviewParserListener ) ((RNAviewParserListener)listener).exitRnaviewFile(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof RNAviewParserVisitor ) return ((RNAviewParserVisitor<? extends T>)visitor).visitRnaviewFile(this);
			else return visitor.visitChildren(this);
		}
	}

	public final RnaviewFileContext rnaviewFile() throws RecognitionException {
		RnaviewFileContext _localctx = new RnaviewFileContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_rnaviewFile);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(2);
			match(START);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static final String _serializedATN =
		"\u0004\u0001\u0001\u0005\u0002\u0000\u0007\u0000\u0001\u0000\u0001\u0000"+
		"\u0001\u0000\u0000\u0000\u0001\u0000\u0000\u0000\u0003\u0000\u0002\u0001"+
		"\u0000\u0000\u0000\u0002\u0003\u0005\u0001\u0000\u0000\u0003\u0001\u0001"+
		"\u0000\u0000\u0000\u0000";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}