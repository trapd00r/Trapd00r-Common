use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Trapd00r::Common',
    AUTHOR              => q{Magnus Woldrich <trapd00r@trapd00r.se>},
    VERSION_FROM        => 'lib/Trapd00r/Common.pm',
    ABSTRACT_FROM       => 'lib/Trapd00r/Common.pm',

    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),

    PL_FILES            => {},

    PREREQ_PM           => {
      'Test::More' =>     0,
    },

    MAN1PODS            => {
    },

    MIN_PERL_VERSION    => 0,

    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Trapd00r-Common-*' },
);
