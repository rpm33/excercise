package Job9::Web::View::TT;

use strict;
use base 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    WRAPPER            => 'wrapper.tt',
);

=head1 NAME

Job9::Web::View::TT - TT View for Job9::Web

=head1 DESCRIPTION

TT View for Job9::Web.

=head1 SEE ALSO

L<Job9::Web>

=head1 AUTHOR

船木大郎

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
