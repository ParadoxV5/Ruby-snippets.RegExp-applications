# I recommend RegExr (https://regexr.com/) for explaining these complex Regexps!

=begin rdoc
Matches North-American phone numbers.

* With or without separators (‘-’, ‘ ’, ‘.’ or ‘_’)
* Alphanumeric
* With or without ‘+1’ or ‘1’
* With or without ‘()’ around region code

+$1+ matches to the region code in whatever format was given (if given). The extracted region code matches to +$2+ if brackets are not added or +$3+ if brackets are.
=end
PHONE = /(?:(?:\+?1[- ._]?)?(([[:alnum:]]{3})|(\(\g<2>\)))[- ._]?)?\g<2>[- ._]?[[:alnum:]]{4}/


=begin rdoc
For matching decimals, as used by #decimal_to_Rational. MatchData:

1. Integer part
2. Non-repeating part of fractional part (with ‘.’)
3. Repeating part
=end
DECIMAL = /\A(\d+)(?:(\.\d*+)(?:\((\d++)\))?)?\z/

=begin rdoc
Converts a decimal String to Rational.
Supports both finites and repating infinites with the repeating part in brackets.
The ‘0’ in “0.” decimals is required. Underscores are not supported.
=end
def decimal_to_Rational(decimal)
  DECIMAL.match(decimal) and # Also checks input.
    $2 ? (
      r = ($1+$2).to_r
      $3 ? r + Rational($3, (10**$3.size - 1) * 10 ** ($2.size-1)) : r
    ) : $1.to_r
end