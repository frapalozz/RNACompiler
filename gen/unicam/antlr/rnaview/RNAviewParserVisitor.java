// Generated from C:/Users/paloz.VALENTINA/Desktop/RNACompiler/src/main/java/unicam/antlr/rnaview/RNAviewParser.g4 by ANTLR 4.13.2
package unicam.antlr.rnaview;
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link RNAviewParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface RNAviewParserVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link RNAviewParser#rnaviewFile}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitRnaviewFile(RNAviewParser.RnaviewFileContext ctx);
}