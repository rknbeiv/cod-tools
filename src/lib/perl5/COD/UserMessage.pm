#------------------------------------------------------------------------------
#$Author$
#$Date$ 
#$Revision$
#$URL$
#------------------------------------------------------------------------------
#*
#  Format run time error and warning messages in a uniform way.
#**

package COD::UserMessage;

use strict;
use warnings;
require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw( print_message error warning note parse_message sprint_message );
our @EXPORT_OK = qw( debug_note );

# characters that will be escaped as HTML5 entities
# '#' symbol is used for starting comment lines
my %program_escape   = ( '&' => "&amp;", ':' => "&colon;", '#' => "&num;");
my %filename_escape  = ( '&' => "&amp;", ':' => "&colon;",
                         '(' => "&lpar;", ')' => "&rpar;" );
my %datablock_escape = ( '&' => "&amp;", ':' => "&colon;" );
my %message_escape   = ( '&' => "&amp;", ':' => "&colon;" ); # ',' => "&comma;"

#==============================================================================
# Print a message, reporting a program name, file name, data block
# name and am error level (ERROR or WARNING) in a uniform way.
#
# For ease of parsing error messages from log files, $message should
# probably not contain a colon (":") since colon is used to separate
# different parts of the error message.

sub sprint_message($$$$$@)
{
    my ( $program, $filename, $datablock, $errlevel,
         $message, $line, $column, $line_contents ) = @_;

    $message =~ s/\.?\n?$//;

    $program = "perl -e '...'" if ( $program eq '-e' );

    $program   = escape_meta( $program,   \%program_escape   );
    $filename  = escape_meta( $filename,  \%filename_escape  );
    $datablock = escape_meta( $datablock, \%datablock_escape );
    $message   = escape_meta( $message,   \%message_escape   );

    return $program . ": " .
           (defined $filename ? $filename .
                (defined $line ? "($line" .
                    (defined $column ? ",$column" : "" ) . ")"
                : "") . 
                (defined $datablock ? " data_" . $datablock : "") . ": "
           : "") .
           (defined $errlevel ? $errlevel . ", " : "") .
           $message .
           (defined $line_contents ? ":\n" . $line_contents . "\n" .
                (defined $column ? " " x ($column-1) . "^\n" : "")
                : ".\n");
}

#==============================================================================
# Generic function for printing messages to STDERR

sub print_message($$$$$@)
{
    my ( $program, $filename, $datablock, $errlevel,
         $message, $line, $column, $line_contents ) = @_;
    print STDERR sprint_message( $program, $filename, $datablock,
                                 $errlevel, $message, $line, $column,
                                 $line_contents );
}

#==============================================================================
# Parse an error message, generated by print_message. To be parsed
# correctly, program, file and datablock names as well as error level must
# not not contain colons (':'). Error level is confined to uninterrupted
# word without colons and commas (','). Error level can be separated from
# the rest of the message by colon.
sub parse_message($)
{
    my( $message ) = @_;
    if( $message =~ /^
                        ([^:]+):\ 
                        (?:
                          ([^:]+?)
                            (?:\((\d+)(?:,(\d+))?\))?
                            (?:\ data_([^:]+?))?
                            :\ 
                        )?
                        (?:([^,:\ ]+?)[,:]\ )?
                        (.+?)\.?
                    $/x ) {
        return {
            program   => unescape_meta($1, \%program_escape ),
            filename  => unescape_meta($2, \%filename_escape),
            line      => $3,
            column    => $4,
            datablock => unescape_meta($5, \%datablock_escape),
            errlevel  => $6,
            message   => unescape_meta($7, \%message_escape)
        };
    } else {
        return undef;
    }
}

#==============================================================================
# Report an error message. Errors are indicated with the "ERROR"
# keyword in the message line. This is supposed to be a fatal even,
# and the program will most probably die() or exit(255) after this
# message, but the UserMessage package does not enforce this policy.

sub error($$$$)
{
    my ( $program, $filename, $datablock, $message ) = @_;
    print_message( $program, $filename, $datablock, "ERROR", $message );
}

#==============================================================================
# Report a warning message. Warnings are indicated with the "WARNING"
# keyword. Program can probably continue after warnings and give a
# reasonable result, but it might be not the result which the user
# expected.

sub warning($$$$)
{
    my ( $program, $filename, $datablock, $message ) = @_;
    print_message( $program, $filename, $datablock, "WARNING", $message );
}

#==============================================================================
# Report a note message. Notes are indicated with the "NOTE"
# keyword. Program can always continue after issuing notes as the intent
# of note is just to provide information on the progress.

sub note($$$$)
{
    my ( $program, $filename, $datablock, $message ) = @_;
    print_message( $program, $filename, $datablock, "NOTE", $message );
}

#==============================================================================
# Report a debug message. Notes are indicated with the "DEBUG"
# keyword. Debug messages should only be printed uppon user request to output
# additional information.

sub debug_note($$$$)
{
    my ( $program, $filename, $datablock, $message ) = @_;
    print_message( $program, $filename, $datablock, "DEBUG", $message );
}

sub escape_meta {
    my ( $text, $escaped_symbols ) = @_;

    return undef if !defined $text;

    my $symbols = join "|", map { $_ = "\\$_" } keys %{$escaped_symbols};

    $text =~ s/($symbols)/$escaped_symbols->{"$1"}/g;

    return $text;
}

sub unescape_meta {
    my ( $text, $escaped_symbols ) = @_;

    return undef if !defined $text;

    my %unescaped_symbols = reverse %{$escaped_symbols};

    my $symbols = join "|", keys %unescaped_symbols;

    $text =~ s/($symbols)/$unescaped_symbols{"$1"}/g;

    return $text;
}

1;
