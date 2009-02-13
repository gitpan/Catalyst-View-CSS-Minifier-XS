package Catalyst::View::CSS::Minifier::XS;

use warnings;
use strict;

use base qw/Catalyst::View/;

our $VERSION = '0.01';

use Carp qw/croak/;
use CSS::Squish;
use CSS::Minifier::XS qw/minify/;
use Data::Dump qw/dump/;
use Path::Class::File;

sub process {
    my ($self,$c) = @_;
    croak 'No CSS files specified in $c->stash->{template}'
        unless defined $c->stash->{template};
    my (@files) = ( ref $c->stash->{template} eq 'ARRAY' ?
        @{ $c->stash->{template} } : 
	split /\s+/, $c->stash->{template} );
    # map files to INCLUDE_PATH
    my $home=$self->config->{INCLUDE_PATH} || $c->path_to('root');
    @files = map { 
       Path::Class::File->new( $home, $_);
    } @files;
    # feed them to CSS::Squish and set the body.
	my $css = CSS::Squish->concatenate(@files);	
    $c->res->content_type("text/css");
    $c->res->body( minify($css) );
}

=head1 NAME

Catalyst::View::CSS::Minifier::XS - Concenate and minify your CSS files.

=head1 VERSION

Version 0.01

=head1 SYNOPSIS

    ./script/myapp_create.pl view CSS CSS::Minifier::XS

    sub css : Local {
		my ($self,$c) = @_;
		$c->stash->{template} = [ qw|/css/small.css /css/big.css| ];		
        $c->forward($c->view('CSS'));
    }

=head1 DESCRIPTION

Take a set of CSS files and integrate them into one big file using 
L<CSS::Squish> and minifies them using L<CSS::Minifier::XS>.  
The files are read from the 'template' stash variable,
and can be provided as a hashref or a space separated scalar.

=head1 SEE ALSO

L<Catalyst> , L<Catalyst::View>, L<CSS::Squish>, L<CSS::Minifier::XS>

=head1 AUTHOR

Ivan Drinchev C<< <drinchev at gmail.com> >>

=head1 THANKS

To Marcus Ramberg C<mramberg@cpan.org> and his L<Catalyst::View::CSS::Squish> on which I've build this one

=head1 BUGS

Please report any bugs or feature requests to C<bug-catalyst-view-css-minifier-xs at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Catalyst-View-CSS-Minifier-XS>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 COPYRIGHT & LICENSE

Copyright 2008 Ivan Drinchev, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of Catalyst::View::CSS::Minifier::XS
