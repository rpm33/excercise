package Job9::Schema::Message;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("message");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "subject",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => 65535,
  },
  "body",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => 65535,
  },
  "user_email",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 64,
  },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->belongs_to("user_email", "Job9::Schema::User", { email => "user_email" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-09-16 16:46:22
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2Gr9MeGhtBLi1jnJrlcivQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
