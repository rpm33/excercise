package Job9::SendMail;

use Moose;
use namespace::clean -except => 'meta';
use Job9::SendMail::Send;

extends 'TheSchwartz::Worker';

__PACKAGE__->meta->make_immutable;

sub work {
    my $self = shift;
    my TheSchwartz::Job $job = shift;

    print "Workin' hard or hardly workin'? Hyuk!!\n";
	Job9::SendMail::Send::email_send('matthew_ipd@clearstory.mints.ne.jp','hoge', 'fuga');

    $job->completed();
}

1;
