#!/usr/local/bin/perl

use strict;
use warnings;

use DBIx::Class::Schema::Loader qw(make_schema_at);

make_schema_at(
    'Job9::Schema',
    {
        debug          => 1,
        dump_directory => './lib',
    },
    [ qw(dbi:mysql:dbname=test) ],
);
