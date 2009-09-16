package Job9::SendMail;

use Moose;
use namespace::clean -except => 'meta';
use Job9::SendMail::Send;
use Job9::Schema;
use Data::Dumper;

extends 'TheSchwartz::Worker';

__PACKAGE__->meta->make_immutable;

sub work {
    my $self = shift;
    my TheSchwartz::Job $job = shift;

    print "Workin' hard or hardly workin'? Hyuk!!\n";
    my $schema = Job9::Schema->connect(qw(dbi:mysql:dbname=test));
    my $row = $schema->resultset('Message')->find({
        id => $job->arg->{id},
    },
    {
        prefetch => 'user_email',
    });
	Job9::SendMail::Send::email_send($row->get_column('user_email'), $row->subject, $row->body);

    $job->completed();
}

1;
