%
% C FORMAT-SPECIFIERS  
%
%	MATLAB has no help information about C format-specifiers
%	in their help files. Here is a quick reminder of what
%	these arcane specifiers are. 
%
%	Information comes from the Sunos man page for format (Tcl).
%	A full listing of cformat.m contains the entire man page.
%
%     d         Convert integer to signed decimal string.
%
%     u         Convert integer to unsigned decimal string.
%
%     i         Convert integer to  signed  decimal  string;  in 
%               decimal, in octal (leading 0) or in hex (leading 0x).
%
%     o         Convert integer to unsigned octal string.
%
%     x or X    Convert integer to  unsigned  hexadecimal  string,
%               using   digits   ``0123456789abcdef''  for  x  and
%               ``0123456789ABCDEF'' for X).
%
%     c         Convert  integer  to  character.
%
%     s         No conversion; just insert string.
%
%     f         Convert floating-point number  to  signed  decimal
%               string of the form xx.yyy, where the number of y's
%               is determined by the precision (default:  6).   If
%               the  precision  is 0 then no decimal point is out-
%               put.
%
%     e or e    Convert floating-point number to scientific  nota-
%               tion  in  the form x.yyye+-zz, where the number of
%               y's is determined by the precision  (default:  6).
%               If  the  precision  is  0 then no decimal point is
%               output.  If the E form is used then E  is  printed
%               instead of e.
%
%     g or G    If the exponent is less than -4 or greater than or
%               equal  to  the  precision,  then convert floating-
%               point number as for %e or %E.   Otherwise  convert
%               as for %f.  Trailing zeroes and a trailing decimal
%               point are omitted.
%
%     %         No conversion: just insert %.
%


%format(n)             Tcl Built-In Commands             format(n)
%
%_________________________________________________________________
%
%NAME
%     format - Format a string in the style of sprintf
%
%SYNOPSIS
%     format formatString ?arg arg ...?
%_________________________________________________________________
%
%INTRODUCTION
%     This command generates a formatted string in the same way as
%     the  ANSI C sprintf procedure (it uses sprintf in its imple-
%     mentation).   FormatString  indicates  how  to  format   the
%     result, using % conversion specifiers as in sprintf, and the
%     additional arguments, if any, provide values to  be  substi-
%     tuted  into the result.  The return value from format is the
%     formatted string.
%
%DETAILS ON FORMATTING
%     The command operates by scanning formatString from  left  to
%     right.  Each character from the format string is appended to
%     the result string unless it is a percent sign.  If the char-
%     acter  is  a  %  then it is not copied to the result string.
%     Instead,  the  characters  following  the  %  character  are
%     treated as a conversion specifier.  The conversion specifier
%     controls the conversion of the next successive arg to a par-
%     ticular  format  and  the  result  is appended to the result
%     string in place of the conversion specifier.  If  there  are
%     multiple  conversion  specifiers  in the format string, then
%     each one controls the conversion of one additional arg.  The
%     format  command  must be given enough args to meet the needs
%     of all of the conversion specifiers in formatString.
%
%     Each conversion specifier may contain up  to  six  different
%     parts: an XPG3 position specifier, a set of flags, a minimum  |
%     field width, a precision, a length modifier, and  a  conver-
%     sion  character.   Any of these fields may be omitted except
%     for the conversion character.  The fields that  are  present
%     must  appear in the order given above.  The paragraphs below
%     discuss each of these fields in turn.
%
%     If the % is followed by a decimal number  and  a  $,  as  in  |
%     ``%2$d'',  then  the  value to convert is not taken from the  |
%     next sequential argument.  Instead, it  is  taken  from  the  |
%     argument indicated by the number, where 1 corresponds to the  |
%     first arg.  If the conversion  specifier  requires  multiple  |
%     arguments because of * characters in the specifier then suc-  |
%     cessive arguments are used, starting with the argument given  |
%     by  the number.  This follows the XPG3 conventions for posi-  |
%     tional specifiers.  If there are any  positional  specifiers  |
%     in  formatString  then  all  of the specifiers must be posi-  |
%     tional.
%
%     The second portion of a conversion specifier may contain any
%     of the following flag characters, in any order:
%
%     -         Specifies that the converted  argument  should  be
%               left-justified  in its field (numbers are normally
%               right-justified with leading spaces if needed).
%
%     +         Specifies that a number should always  be  printed
%               with a sign, even if positive.
%
%     space     Specifies that a space  should  be  added  to  the
%               beginning  of  the  number  if the first character
%               isn't a sign.
%
%     0         Specifies that the number should be padded on  the
%               left with zeroes instead of spaces.
%
%     #         Requests an alternate output form.  For  o  and  O
%               conversions  it guarantees that the first digit is
%               always 0.  For  x  or  X  conversions,  0x  or  0X
%               (respectively)  will  be added to the beginning of
%               the result unless it is zero.  For  all  floating-
%               point  conversions  (e, E, f, g, and G) it guaran-
%               tees that the result always has a  decimal  point.
%               For g and G conversions it specifies that trailing
%               zeroes should not be removed.
%
%     The third portion of a conversion specifier is a number giv-
%     ing  a minimum field width for this conversion.  It is typi-
%     cally used to make columns line up in tabular printouts.  If
%     the  converted  argument  contains fewer characters than the
%     minimum field width then it will be padded so that it is  as
%     wide as the minimum field width.  Padding normally occurs by
%     adding extra spaces on the left of the  converted  argument,
%     but  the  0  and - flags may be used to specify padding with
%     zeroes on the left or with  spaces  on  the  right,  respec-
%     tively.  If the minimum field width is specified as * rather
%     than a number, then the next argument to the format  command
%     determines  the  minimum  field  width; it must be a numeric
%     string.
%
%     The fourth portion of a conversion specifier is a precision,
%     which consists of a period followed by a number.  The number
%     is used in different ways for different conversions.  For e,
%     E,  and  f  conversions it specifies the number of digits to
%     appear to the right of the  decimal  point.   For  g  and  G
%     conversions  it  specifies  the  total  number  of digits to
%     appear, including those on both sides of the  decimal  point
%     (however, trailing zeroes after the decimal point will still
%     be omitted unless the  #  flag  has  been  specified).   For
%     integer conversions, it specifies a mimimum number of digits
%     to print (leading zeroes will be added if necessary).  For s
%     conversions it specifies the maximum number of characters to
%     be printed; if the string  is  longer  than  this  then  the
%     trailing  characters  will  be dropped.  If the precision is
%     specified with * rather than a number then the next argument
%     to the format command determines the precision; it must be a
%     numeric string.
%
%     The fourth part of a conversion specifier is a length modif-
%     ier, which must be h or l.  If it is h it specifies that the
%     numeric value should be truncated to a 16-bit  value  before
%     converting.   This  option is rarely useful.  The l modifier
%     is ignored.
%
%     The last thing in a conversion specifier  is  an  alphabetic
%     character  that  determines  what kind of conversion to per-
%     form.  The following  conversion  characters  are  currently
%     supported:
%
%     d         Convert integer to signed decimal string.
%
%     u         Convert integer to unsigned decimal string.
%
%     i         Convert integer to  signed  decimal  string;   the
%               integer may either be in decimal, in octal (with a
%               leading 0) or in hexadecimal (with a leading 0x).
%
%     o         Convert integer to unsigned octal string.
%
%     x or X    Convert integer to  unsigned  hexadecimal  string,
%               using   digits   ``0123456789abcdef''  for  x  and
%               ``0123456789ABCDEF'' for X).
%
%     c         Convert  integer  to  the   8-bit   character   it
%               represents.
%
%     s         No conversion; just insert string.
%
%     f         Convert floating-point number  to  signed  decimal
%               string of the form xx.yyy, where the number of y's
%               is determined by the precision (default:  6).   If
%               the  precision  is 0 then no decimal point is out-
%               put.
%
%     e or e    Convert floating-point number to scientific  nota-
%               tion  in  the form x.yyye+-zz, where the number of
%               y's is determined by the precision  (default:  6).
%               If  the  precision  is  0 then no decimal point is
%               output.  If the E form is used then E  is  printed
%               instead of e.
%
%     g or G    If the exponent is less than -4 or greater than or
%               equal  to  the  precision,  then convert floating-
%               point number as for %e or %E.   Otherwise  convert
%               as for %f.  Trailing zeroes and a trailing decimal
%               point are omitted.
%
%     %         No conversion: just insert %.
%
%     For the numerical conversions the argument  being  converted
%     must be an integer or floating-point string; format converts
%     the argument to binary and then converts it back to a string
%     according to the conversion specifier.
%
%DIFFERENCES FROM ANSI SPRINTF
%     The behavior of the format command is the same as the ANSI C  |
%     sprintf procedure except for the following differences:       |
%
%     [1]  %p and %n specifiers are not currently supported.        |
%
%     [2]  For %c conversions  the  argument  must  be  a  decimal
%          string, which will then be converted to the correspond-
%          ing character value.
%
%     [3]  The l modifier is ignored;  integer values  are  always  |
%          converted as if there were no modifier present and real  |
%          values are always converted as if the l  modifier  were  |
%          present  (i.e.  type  double  is  used for the internal  |
%          representation).  If the h modifier is  specified  then  |
%          integer  values  are  truncated to short before conver-  |
%          sion.
%
%KEYWORDS
%     conversion specifier, format, sprintf, string, substitution
%

help cformat
