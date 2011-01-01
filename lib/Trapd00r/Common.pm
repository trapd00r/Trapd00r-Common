package Trapd00r::Common;

$VERSION  = '0.02';

BEGIN {
  require Exporter;
  use vars qw(@ISA @EXPORT);
  @ISA    = 'Exporter';
  @EXPORT = qw(
    invalid_regex
    shell_escape
    isa_arrayref
    to_tty
  );
};

use strict;
use Carp;
use Data::Dumper;
$Data::Dumper::Terse     = 1;
$Data::Dumper::Indent    = 1;
$Data::Dumper::Useqq     = 1;
$Data::Dumper::Deparse   = 1;
$Data::Dumper::Quotekeys = 0;
$Data::Dumper::Sortkeys  = 1;


sub shell_escape {
  my $string = shift;
  my @data   = isa_arrayref($string);

  map { $_ =~  s/([;<>\*\|`&\$!#\(\)\[\]\{\}:'"])/\\$1/g; } @data;

  return (wantarray()) ? @data : join(' ', @data);
}

sub invalid_regex {
  my $regex   = shift;
  my @regexes = isa_arrayref($regex);

  for my $r(@regexes) {
    eval { qr/$r/; };
    if($@) {
      return 1;
    }
    next; # valid
  }
  return 0;
}

sub isa_arrayref {
  my $string = shift;
  my @data;

  if(ref($string) eq 'ARRAY') {
    push(@data, @{$string});
  }
  elsif(ref($string) eq '') {
    push(@data, $string);
  }
  else {
    return undef;
  }

  return (wantarray()) ? @data : scalar(@data);
}

sub to_tty {
  return (-t STDOUT) ? 1 : 0;
}


=pod

=head1 NAME

Trapd00r::Common - Commonly used functions

=head1 SYNOPSIS

=head1 DESCRIPTION


=head1 EXPORTS

=over 2

=item invalid_regex()

Parameters: $regex | \@regexes

  if(invalid_regex(\@regexes)) {
    # One or more regexes invalid
    ...
  }

=item to_tty()

Returns true if connected to a TTY.

=item isa_arrayref()

Parameters: \@array

Resolves an array reference and returns an array in list context.

=item shell_escape()

Parameters: $string | \@strings

Returns it's arguments clean from characters your shell might otherwise munch.

=head1 SEE ALSO


=head1 AUTHOR

  Magnus Woldrich
  CPAN ID: WOLDRICH
  magnus@trapd00r.se
  http://japh.se

=head1 COPYRIGHT

Copyright 2010 Magnus Woldrich <magnus@trapd00r.se>. This program is free
software; you may redistribute it and/or modify it under the same terms as
Perl itself.

=cut

1;
