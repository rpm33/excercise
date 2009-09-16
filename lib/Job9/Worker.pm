package Job9::Worker;

use Moose;
use namespace::clean -except => 'meta';
use TheSchwartz;
use Job9::SendMail;

has databases => (
    is       => 'rw',
    isa      => 'ArrayRef[HashRef]',
    required => 1,
    default  => sub { [ { dsn => 'dbi:mysql:dbname=test' } ] },
);

__PACKAGE__->meta->make_immutable;

sub run {
    my $self = shift;

    my $client = TheSchwartz->new( databases => $self->databases );
    $client->can_do('Job9::SendMail');
    $client->work();
}

1;
