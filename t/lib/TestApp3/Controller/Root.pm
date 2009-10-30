package TestApp3::Controller::Root;
our $VERSION = '1.093030';



use strict;
use warnings;

use parent 'Catalyst::Controller';

__PACKAGE__->config->{namespace} = '';

sub station : Local {
   my ( $self, $c ) = @_;
   $c->stash->{css} = 'station';
}

sub test : Local {
   my ( $self, $c ) = @_;
   $c->stash->{css} = 'test';

   $c->forward( 'TestApp3::View::CSS' );
}

1;
