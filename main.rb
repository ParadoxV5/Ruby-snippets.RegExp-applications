=begin
  I recommend RegExr (https://regexr.com/) for explaining these complex RegExps!
=end

REGEX = /\A((?<c>_|\d)+\.(\g<c>*+))(?:\((\g<3>)\))?\z/

=begin rdoc
  Converts a decimal String to Rational.
  Supports both finites and repating infinites with the repeating part in brackets.
=end
def decimal_to_Rational(decimal)

end