package Job9::Sender;

use Moose;
use namespace::clean -except => 'meta';
use TheSchwartz;

has databases => (
    is       => 'rw',
    isa      => 'ArrayRef[HashRef]',
    required => 1,
    default  => sub { [ { dsn => 'dbi:mysql:dbname=test' } ] },
);

__PACKAGE__->meta->make_immutable;

sub send {
    my $self = shift;

    my $client = TheSchwartz->new( databases => $self->databases );
    $client->insert('Job9::SendMail', { key => 'value' });
}

1;
