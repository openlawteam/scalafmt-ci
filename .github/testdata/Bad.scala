/* Just a random file I took from the scalafmt source code and made some style 
messiness added to it. -mroth */
package org.scalafmt

sealed abstract class Formatted {

  def toEither: Either[Throwable, String] = this match {
      case Formatted.Success(s) => Right(s)
      case Formatted.Failure(e) => Left(e)      // too much space before comment
  }

  def get: String = this match {
    case Formatted.Success(code) => code
    case Formatted.Failure(e) => throw e        
  }
}

/** Aligned by first asterisk, default ScalaDoc style is second.
 *
 */
object Formatted {
    case class Success(formattedCode: String) extends Formatted
    case class Failure(e: Throwable) extends Formatted
}