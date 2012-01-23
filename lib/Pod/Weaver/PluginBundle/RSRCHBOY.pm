package Pod::Weaver::PluginBundle::RSRCHBOY;

# ABSTRACT: Document your modules like RSRCHBOY does

use strict;
use warnings;

use Pod::Weaver::Config::Assembler;

sub _exp { Pod::Weaver::Config::Assembler->expand_package($_[0]) }
sub _exp2 { [ "\@RSRCHBOY/$_[0]", _exp($_[0]), {} ] }

use Pod::Weaver::Config::Assembler;


sub mvp_bundle_config {
    return (
        [ '@RSRCHBOY/CorePrep',  _exp('@CorePrep'),    {} ],
        _exp2('Name'),
        _exp2('Version'),
        [ '@RSRCHBOY/prelude',   _exp('Region'),       { region_name => 'prelude' } ],

        [ 'SYNOPSIS',         _exp('Generic'),      {} ],
        [ 'DESCRIPTION',      _exp('Generic'),      {} ],
        [ 'OVERVIEW',         _exp('Generic'),      {} ],

        [ 'ATTRIBUTES',       _exp('Collect'),      { command => 'attr'   } ],
        [ 'METHODS',          _exp('Collect'),      { command => 'method' } ],
        [ 'FUNCTIONS',        _exp('Collect'),      { command => 'func'   } ],
        [ 'TYPES',            _exp('Collect'),      { command => 'type'   } ],
        [ 'TEST_FUNCTIONS',   _exp('Collect'),      { command => 'test'   } ],

        _exp2('Leftovers'),

        [ '@RSRCHBOY/postlude',  _exp('Region'),       { region_name => 'postlude' } ],

        _exp2('SeeAlso'),
        _exp2('SourceGitHub'),
        _exp2('Bugs'),

        _exp2('Authors'),
        _exp2('Legal'),

        [ '@RSRCHBOY/List',      _exp('-Transformer'), { transformer => 'List' } ],
        [ '@RSRCHBOY/Encoding',  _exp('-Encoding'),    {} ],
    );
}

!!42;

__END__

=head1 SYNOPSIS

In weaver.ini:

  [@RSRCHBOY]

or in dist.ini:

  [PodWeaver]
  config_plugin = @RSRCHBOY

=head1 DESCRIPTION

This is the L<Pod::Weaver> config I use for building my
documentation.

=head1 OVERVIEW

This plugin bundle is equivalent to the following weaver.ini file:

  [@CorePrep]

  [Name]

  [Region / prelude]

  [Generic / SYNOPSIS]
  [Generic / DESCRIPTION]
  [Generic / OVERVIEW]

  [Collect / ATTRIBUTES]
  command = attr

  [Collect / METHODS]
  command = method

  [Collect / FUNCTIONS]
  command = func

  [Collect / TEST_FUNCTIONS]
  command = test

  [Leftovers]

  [Region / postlude]

  [SeeAlso]
  [SourceGitHub]
  [Bugs]
  [Authors]
  [Legal]

  [-Transformer]
  transformer = List

  [-Encoding]

=for Pod::Coverage mvp_bundle_config

=cut
