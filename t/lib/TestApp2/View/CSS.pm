package TestApp2::View::CSS;
our $VERSION = '1.093030';



use strict;
use warnings;

use parent 'Catalyst::View::CSS::Minifier::XS';

__PACKAGE__->config(
   path => 'ssc',
);

1;
