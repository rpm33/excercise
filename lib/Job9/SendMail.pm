package Job9::SendMail;

use Moose;
use namespace::clean -except => 'meta';

extends 'TheSchwartz::Worker';

__PACKAGE__->meta->make_immutable;

sub work {
    my $self = shift;
    my TheSchwartz::Job $job = shift;

    print "Workin' hard or hardly workin'? Hyuk!!\n";

    $job->completed();
}

1;
