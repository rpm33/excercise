package Job9::Web::Controller::Root;

use strict;
use warnings;
use parent 'Catalyst::Controller';

use Job9::Sender;


#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config->{namespace} = '';

=head1 NAME

Job9::Web::Controller::Root - Root Controller for Job9::Web

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=cut

=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    if ($c->req->param('submit')) {
        $c->session->{email} = $c->req->param('email');
        $c->res->redirect( $c->uri_for('message') );
    }
}

sub message :Path('message') :Args(0) {
    my ( $self, $c ) = @_;
    my $email = $c->session->{email};
    my $body  = $c->req->params->{body};
    my $sub   = $c->req->params->{subject};
    my $mes   = $c->model('Message')->insert({
      subject => $subject,
      body    => $body,
      email   => $email,
    });

   Job9::Sender->new->send( $mes->id );
    
}




sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

船木大郎

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
