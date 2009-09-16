package Job9::Schema::User;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("user");
__PACKAGE__->add_columns(
  "email",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 32,
  },
);
__PACKAGE__->set_primary_key("email");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-09-16 16:01:09
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Ofp4+65MKXUEtVqGhUdYOA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
