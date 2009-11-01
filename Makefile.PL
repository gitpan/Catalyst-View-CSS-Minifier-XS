
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  DISTNAME  => 'Catalyst-View-CSS-Minifier-XS',
  NAME      => 'Catalyst::View::CSS::Minifier::XS',
  AUTHOR    => "Ivan\ Drinchev\ \<drinchev\ \(at\)\ gmail\ \(dot\)\ com\>\,\ Arthur\ Axel\ \"fREW\"\ Schmidt\ \<frioux\@gmail\.com\>",
  ABSTRACT  => "Minify\ your\ served\ CSS\ files",
  VERSION   => '1.093050',
  EXE_FILES => [ qw() ],
  (eval { ExtUtils::MakeMaker->VERSION(6.31) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM    => {
  (eval { ExtUtils::MakeMaker->VERSION(6.55_01) } ? () : (
    "parent" => '0',
    "FindBin" => '0',
    "File::Spec" => '0',
    "Test::More" => '0.88',
    "HTTP::Headers" => '0',
    "HTTP::Request" => '0',
    "Catalyst::Test" => '0',
  )),
    "URI" => '0',
    "CSS::Minifier::XS" => '0',
    "Catalyst" => '5.64',
    "Path::Class::File" => '0.17',
    "Moose" => '0',
  },
(eval { ExtUtils::MakeMaker->VERSION(6.55_01) } ? (
  BUILD_REQUIRES    => {
    "parent" => '0',
    "FindBin" => '0',
    "File::Spec" => '0',
    "Test::More" => '0.88',
    "HTTP::Headers" => '0',
    "HTTP::Request" => '0',
    "Catalyst::Test" => '0',
  },
) : ()),
  test => {TESTS => 't/*.t'}
);

