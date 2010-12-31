package Trapd00r::Common;

$VERSION  = '0.01';

BEGIN {
  require Exporter;
  use vars qw(@ISA @EXPORT);
  @ISA    = 'Exporter';
  @EXPORT = qw(invalid_regex);
}

use strict;
use Carp;
use Data::Dumper;
$Data::Dumper::Terse     = 1;
$Data::Dumper::Indent    = 1;
$Data::Dumper::Useqq     = 1;
$Data::Dumper::Deparse   = 1;
$Data::Dumper::Quotekeys = 0;
$Data::Dumper::Sortkeys  = 1;



=pod

=head1 NAME

Trapd00r::Common - Commonly used functions

=head1 SYNOPSIS

    # Imported functions into your namespace:
    # invalid_regex()

=head1 DESCRIPTION


=head1 EXPORTS

=head2 invalid_regex()

Parameters: $regex | \@regexes

Returns: BOL

  if(invalid_regex($regex)) {
    ...
  }


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
