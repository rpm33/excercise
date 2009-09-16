package Job9::SendMail::Send;

use strict;
use warnings;

use Encode;
use Email::MIME;
use Email::MIME::Creator;
use Email::Send;

sub email_send {
	my ($to, $subject, $body) = @_;

	my $mail = Email::MIME->create(
	    header => [
	        From    => 'job9.mailer@gmail.com',
	        To      => $to,
	        Subject => Encode::encode('MIME-Header-ISO_2022_JP', $subject),
	    ],
	    parts => [
	        encode('iso-2022-jp', $body),
	    ],
	);


	my $sender = Email::Send->new({
		mailer => 'SMTP::TLS',
		mailer_args => [
			Host => 'smtp.gmail.com',
			Port => 587,
			User => 'job9.mailer@gmail.com',
			Password => 'AtbJBtk8',
		],
	});
	eval {$sender->send($mail)};
	print "Error sending email: $@" if $@;
}

1;
